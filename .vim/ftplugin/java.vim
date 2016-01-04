" TODO checkstyle, tests
" Aliases
iabbrev sysout System.out.println(

" Compiler
au! BufWritePost *.java call s:JavaCheck() 

function! s:JavaCheck()
    let error_lines = s:Compile()
    if empty(error_lines[0])
      let error_lines = s:Checkstyle()
    endif
    call s:ShowErrors(error_lines)
endfunction

function! s:Checkstyle()
    if has('win32unix') 
      let checkstyle_classpath = "$CYGHOME/lib/checkstyle-5.6/checkstyle-5.6-all.jar"
      let checkstyle_conf_file = "$CYGHOME/lib/checkstyle-5.6/sun_checks.xml"
    elseif has('unix') && !has('win32unix')
      let checkstyle_classpath = "$HOME/lib/checkstyle-5.6/checkstyle-5.6-all.jar"
      let checkstyle_conf_file = "$HOME/lib/checkstyle-5.6/sun_checks.xml"
    endif

    let file_path = s:GetPathToCurrentFile()

    let command = 'java -cp "' . checkstyle_classpath . '" com.puppycrawl.tools.checkstyle.Main -c "' . checkstyle_conf_file . '" -f xml ' . file_path 

    let errorformat =
        \ '%P<file name="%f">,' .
        \ '%Q</file>,' .
        \ '%E<error line="%l" column="%c" severity="%trror" message="%m" source="%.%#"/>,' .
        \ '%E<error line="%l" severity="%trror" message="%m" source="%.%#"/>,' .
        \ '%E<error line="%l" column="%c" severity="%tarning" message="%m" source="%.%#"/>,' .
        \ '%E<error line="%l" severity="%tarning" message="%m" source="%.%#"/>,' .
        \ '%-G%.%#'

    let &errorformat = errorformat 
    let error_lines = s:RunCommand(command)
    return error_lines
endfunction

function! s:Compile()
    let g:javac_command = 'javac'
    "let g:javac_command = 'javacClient.sh'
    if has('win32unix') 
      let g:javac_classpath_file = '.classpath_win'
    elseif has('unix') && !has('win32unix')
      let g:javac_classpath_file = '.classpath_unix'
    endif

    let command = s:GetCompileCommand()

    " unashamedly stolen from *errorformat-javac* (quickfix.txt) and modified to include error types
    let errorformat =
        \ '%E%f:%l:\ error:\ %m,'.
        \ '%W%f:%l:\ warning:\ %m,'.
        \ '%A%f:%l:\ %m,'.
        \ '%+Z%p^,'.
        \ '%+C%.%#,'.
        \ '%-G%.%#'

"    let &errorformat = errorformat 
"    let &makeprg = compile_command 
"    silent! make   
"    redraw!
"    cw

    let &errorformat = errorformat 
    let error_lines = s:RunCommand(command)
    return error_lines
    
endfunction

function! s:RunCommand(command)

    let error_lines = split(system(a:command), "\n", 1)
    let error_lines = s:CygwinRemoveCR(error_lines) 

    return error_lines

endfunction

function! s:ShowErrors(error_lines)
   
    cgetexpr a:error_lines  

    "let errors = copy(getqflist())
    "echo errors

    cwindow
endfunction

function! s:GetCompileCommand()
    let classpath = s:LoadClasspathFromFile(g:javac_classpath_file)
    
    let file_path = s:GetPathToCurrentFile()

    let output_directory = s:OutputDirectory()

    let compile_command = g:javac_command . ' -source 1.7 -cp "' . classpath . '" -d "' . output_directory  . '" ' . file_path 
    return compile_command
endfunction

function! s:LoadClasspathFromFile(file)
    let classpath = ''

    if filereadable(a:file)
        let lines = readfile(a:file)
        let classpath = get(lines, 0, '')
    endif 

    return classpath 
endfunction

function! s:GetPathToCurrentFile()
    let fname = fnameescape(expand('%:p'))

    if has('win32unix')
        let fname =  s:CygwinPath(fname)
    endif

    return fname
endfunction

function! s:CygwinPath(path)
    return substitute(system("cygpath -m ".a:path), '\n', '', 'g')
endfunction

function! s:OutputDirectory()
    let output_dir = getcwd()
    if match(expand( '%:p:h' ), "src.main.java") >= 0
        let output_dir .= '/target/classes'
    endif
    if match(expand( '%:p:h' ), "src.test.java") >= 0
        let output_dir .= '/target/test-classes'
    endif

    if has('win32unix')
        let output_dir=s:CygwinPath(output_dir)
    endif
    return output_dir
endfunction

function! s:CygwinRemoveCR(errors)
    if has('win32unix')
        let filtered = []
        for error_line in a:errors 
            let error_line = s:RemoveCarriageReturn(error_line)
            call add(filtered, error_line)
        endfor
        return filtered
    endif

    return a:errors
endfunction

function! s:RemoveCarriageReturn(line)
    return substitute(a:line, '\r', '', 'g')
endfunction

" Tests

function! RunTest(...)
  let classpath = s:LoadClasspathFromFile(g:javac_classpath_file)
  let test_command = 'java -cp "'. classpath .'" org.junit.runner.JUnitCore ' . GetFullyQualifiedClassName() 
  call ExecuteCommand(test_command)
endfunction

function! RunOneTest(...)
  let classpath = s:LoadClasspathFromFile(g:javac_classpath_file)
  let test_command = 'java -cp "'. classpath .'" org.junit.runner.SingleJUnitTestRunner ' . GetFullyQualifiedClassName() ."\\#".TestMethodName()
  call ExecuteCommand(test_command)
endfunction

function! ExecuteCommand(command)
  echo a:command
  echom a:command

  if exists('g:ScreenShellSend')
    call g:ScreenShellSend(a:command)
  else
    execute '!'.a:command 
  endif
endfunction

function! GetFullyQualifiedClassName()
  let l:pos = getpos('.')
  call cursor(1,1)

  if  search('package\s\+\w\+', 'ce')
    let package_name = substitute(expand('<cWORD>'), ";", ".", "")
    if search('class\s\+\w\+', 'ce')
      let class_name = expand('<cword>')
      let fully_qualified_class_name = package_name . class_name
    endif
  endif

  call setpos('.', l:pos)

  return fully_qualified_class_name
endfunction

function! TestMethodName()
  let l:pos = getpos('.')
  try
    if search('@Test\>', 'bWc')
      if search('\s\w\+(', 'W')
        return expand('<cword>')
      endif
    endif
  finally
    call setpos('.', l:pos)
  endtry
  return ''
endfunction

" ------------------------- Maven  ----------------------------

function! RunMavenTest(...)
  let l:file_name = expand('%:t')
  let l:command = 'mvn test -Dtest='.l:file_name."\\#".TestMethodName()
  echo l:command
  echom l:command
  if exists('g:ScreenShellSend')
    call g:ScreenShellSend(l:command)
  else
    execute '!'.l:command 
  endif
endfunction

function! RunMavenTests(...)
  let l:file_name = expand('%:t')
  let l:command = 'mvn test -Dtest='.l:file_name
  echo l:command
  echom l:command
  if exists('g:ScreenShellSend')
    call g:ScreenShellSend(l:command)
  else
    execute '!'.l:command 
  endif
endfunction

function! RunMavenMain(...)
 let main = matchstr(expand("%:p"), '^.*[/\\]src[/\\]test[/\\]\(test\|java\)[/\\]\zs.*')
 let scope='-Dexec.classpathScope="test"'
 let mainsrc = matchstr(expand("%:p"), '^.*[/\\]src[/\\]main[/\\]\(test\|java\)[/\\]\zs.*')
 if mainsrc != ''
  let scope = ''
  let main = mainsrc
 endif
 echo scope.main
 
 let command='!mvn exec:java '.scope.' -Dexec.mainClass='.strpart(substitute(main, "/", "\.", "g"), 0, strlen(main) -5)
 if(exists('a:1'))
    let command .= ' -Dexec.arguments='.a:1
 endif
 echo command 
 execute command 
endfunction

"  let l:cla = matchstr(expand("%:p"), '^.*[/\\]src[/\\]test[/\\]\(test\|java\)[/\\]\zs.*')
"  let l:class = strpart(substitute(l:cla, "/", "\.", "g"), 0, strlen(l:cla) -5)
"  return l:class
"let g:syntastic_java_javac_options = '-source 1.6 -d ' . s:MavenOutputDirectory()
"let g:syntastic_java_javac_executable = 'javacTask.sh'
"let g:syntastic_java_javac_executable = 'javac'
"let g:syntastic_java_javac_executable = 'javacClient.sh'

"map <leader>u :w\|:!mvn test -Dtest=<C-R>=expand('%:t')."\\#".TestMethodName()<cr><cr>
"map <leader>t :w\|:!mvn test -Dtest=<C-R>=expand('%:t')<cr><cr>
"map <leader>m :!mvn exec:java -Dexec.classpathScope="test" -Dexec.mainClass=substitute(<C-R>=expand('%:r'), '','','g')<cr>
"com.acxiom.pmi.spice.facade.MetadataTest"

" nnoremap <silent> <buffer> <leader>ju :call eclim#java#util#Java('org.junit.runner.SingleJUnitTestRunner', eclim#java#util#GetFullyQualifiedClassname()."\\#".TestMethodName())<cr>
" nnoremap <silent> <buffer> <leader>jt :call eclim#java#util#Java('org.junit.runner.JUnitCore', eclim#java#util#GetFullyQualifiedClassname())<cr>
