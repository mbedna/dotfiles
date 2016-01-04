"let g:phpunit_cmd = "phpunit.bat"
"let g:phpunit_cmd = "php -dxdebug.remote_autostart=1 -dxdebug.remote_port=9009 ~/bin/phpunit"
"let g:phpunit_args = "--coverage-html --configuration phpunit.xml.dist"
"let g:phpunit_args = " --configuration phpunit.xml.dist"
"let g:phpunit_args = "--coverage-html --configuration phpunit.xml.dist -dxdebug.remote_autostart=1 -dxdebug.remote_port=9009"
" Let PHPUnitQf use the callback function

let g:phpunit_cmd = "php -d xdebug.profiler_enable=on /home/mbedna/bin/phpunit "
let g:phpunit_debug=1
let g:phpunit_callback = "CakePHPTestCallback"

function! CakePHPTestCallback(args)
    " Trim white space
    let l:args = substitute(a:args, '^\s*\(.\{-}\)\s*$', '\1', '')
    echom 'argumenty: '.l:args
    if filereadable("app/phpunit.xml.dist")
        let l:config = ' -v --debug --configuration app/phpunit.xml.dist'
    endif

    if filereadable("phpunit.xml.dist")
        let l:config = ' -v --debug --configuration phpunit.xml.dist'
    endif

    " If no arguments are passed to :Test
    let l:file = expand('%')
    echom 'File: '.l:file
    if l:file =~ ".*Tests.*"
        " If the current file is a unit test
        let l:file = substitute(l:file,'^app/Test/Case/\(.\{-}\)Test\.php$','\1','')
        echom 'current file is unit test '.l:file
    else
        " Otherwise try and run the test for this file
        let l:file = substitute(l:file,'^app/\(.\{-}\)\.php$','\1','')
        echom 'try to find test for this file '.l:file
    endif

    if l:args == 'all'
        let l:command = l:config
    endif
    if l:args == 'one'
        let l:command = l:config.' --filter '.TestMethodName().' '.l:file
    endif
    if l:args == ''
        let l:command = l:config.' '.l:file
    endif
    echom 'command: '.l:command
    return l:command
endfunction

function! RunTest(...)
    execute 'Test'
endfunction

function! RunTests(...)
    execute "Test all"
endfunction

function! RunOneTest(...)
    execute "Test one"
endfunction

function! TestMethodName()
  let l:pos = getpos('.')
  try
    if search('function\>', 'bWc')
      let l:found = expand('<cword>')
      echom 'Test method: '.l:found
      if search('\s\w\+(', 'W')
        return expand('<cword>')
      endif
    endif
  finally
    call setpos('.', l:pos)
  endtry
  return ''
endfunction
"function! RunTests(...)
"" echo cla 
"" "still need to replace /s with .s
"" let class = "java -cp \"/home/paws/.m2/repository/junit/junit/4.8.2/junit-4.8.2.jar:.\" org.junit.runner.JUnitCore " .  strpart(substitute(cla, "/", "\.", "g"), 0, strlen(cla) -5)
""
"" let class = ":Java org.junit.runner.JUnitCore " .  strpart(substitute(cla, "/", "\.", "g"), 0, strlen(cla) -5)
"
"  if g:syntastic_java_javac_classpath_line == ''
"    echom 'Please write one of files in the project' 
"    return
"  endif 
"
"  let l:cla = matchstr(expand("%:p"), '^.*[/\\]src[/\\]test[/\\]\(test\|java\)[/\\]\zs.*')
"  let l:file_name = expand('%:t')
"  let l:command = 'java -cp "'. g:syntastic_java_javac_classpath_line .'" org.junit.runner.JUnitCore ' . strpart(substitute(l:cla, "/", "\.", "g"), 0, strlen(l:cla) -5)
"  echo l:command
"  echom l:command
"  if exists('g:ScreenShellSend')
"    call g:ScreenShellSend(l:command)
"  else
"    execute '!'.l:command 
"  endif
"endfunction
"
"function! RunTest(...)
"  let l:cla = matchstr(expand("%:p"), '^.*[/\\]src[/\\]test[/\\]\(test\|java\)[/\\]\zs.*')
"  let l:file_name = expand('%:t')
"  let l:command = 'java -cp "'. g:syntastic_java_javac_classpath_line .'" org.junit.runner.SingleJUnitTestRunner ' . strpart(substitute(l:cla, "/", "\.", "g"), 0, strlen(l:cla) -5)."\\#".TestMethodName()
""  let l:command = 'mvn test -Dtest='.l:file_name."\\#".TestMethodName()
"  echo l:command
"  echom l:command
"  if exists('g:ScreenShellSend')
"    call g:ScreenShellSend(l:command)
"  else
"    execute '!'.l:command 
"  endif
"endfunction
"
"function! TestMethodName()
"  let l:pos = getpos('.')
"  try
"    if search('@Test\>', 'bWc')
"      if search('\s\w\+(', 'W')
"        return expand('<cword>')
"      endif
"    endif
"  finally
"    call setpos('.', l:pos)
"  endtry
"  return ''
"endfunction
" nnoremap <silent> <buffer> <leader>ju :call eclim#java#util#Java('org.junit.runner.SingleJUnitTestRunner', eclim#java#util#GetFullyQualifiedClassname()."\\#".TestMethodName())<cr>
" nnoremap <silent> <buffer> <leader>jt :call eclim#java#util#Java('org.junit.runner.JUnitCore', eclim#java#util#GetFullyQualifiedClassname())<cr>
