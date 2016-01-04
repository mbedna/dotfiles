"if exists("loaded_vimdebugger")
"   finish
"endif

let loaded_vimdebugger = 1
let s:connected   = 0

highlight DebugBreak guibg=darkred    guifg=white ctermbg=darkred    ctermfg=white
highlight DebugStop  guibg=darkblue   guifg=white ctermbg=darkblue   ctermfg=white

sign define breakpoint linehl=DebugBreak text=x
sign define current    linehl=DebugStop text=>

" Get ready for communication
function! VDBInit(fifo, pwd, type)
    if s:connected " sanity check
        echo "Already communicating with a VDB Session!"
        return
    endif

    let s:connected=1
    let s:type = a:type
    let s:fifo = a:fifo
    execute "cd ". a:pwd
    call VDBKeyMap()
    let g:loaded_vimdebugger_mappings=1
    if !exists(":Vdb")
      command -nargs=+ Vdb        :call VDBCommand(<q-args>, v:count)
    endif

    python import os
    silent exec 'python os.chdir("' . a:pwd . '")'
    silent exec 'python fifo = "' . s:fifo . '"'
endfunction

function! VDBClose()
    "call s:DeleteMenu()
    "redir! > .gdbvim_breakpoints
    "silent call s:DumpBreakpoints()
    "redir END
    sign unplace *
    "let s:BpSet = ""
    let s:connected=0
endfunction

function! VDBIsConnected()
    return s:connected
endfunction

function! VDBCommand(cmd, ...)
    " Ignore whitespace
    if match (a:cmd, '^\s*$') != -1
        return
    endif

    " Create command arguments
    let suff=""

    if 0 < a:0 && a:1 != 0
        let suff = " " . a:1
    endif

    " Send the command
    "silent exec ":redir >>" . s:fifo ."|echon \"" . a:cmd.suff . "\n\"|redir END "
    "silent exec ':!echo "' . a:cmd . suff . '" >> ' . s:fifo
    python fd = open(fifo, 'w')
    exec 'python fd.write("%s\n" % "' . a:cmd . suff . '")'
    python fd.close()
endfunction

function! VDBBreakSet(id, file, linenum)
    try
        let l:filename = VDBJumpToLine(a:linenum, a:file)
        execute "sign unplace " . a:id
        execute "sign place   " . a:id . " name=breakpoint line=".a:linenum." file=".l:filename
    catch /file not found.*/
        echo "File ".a:file." not found."
    endtry
endfunction

function! VDBBreakClear(id, file)
    let l:filename = findfile(a:file)
    execute "sign unplace " . a:id . " file=".l:filename
endfunction

function! VDBJumpToLine(line, file)
    let l:foundFile = findfile(a:file)
    if !bufexists(l:foundFile)
        if !filereadable(l:foundFile)
            throw "file not found:".a:file
        endif
        execute "e ".l:foundFile
    else
        execute "b ".l:foundFile
    endif
    :execute a:line
    :silent! foldopen!
    return l:foundFile
endfunction

function! VDBHighlightLine(line, file)
    try {
        let l:foundFile = VDBJumpToLine(a:line, a:file)
        execute "sign unplace ". 1
        execute "sign place " .  1 ." name=current line=".a:line." file=".l:foundFile
    catch /file not found.*/
        echo "File ".a:file." not found."
    endtry
endfunction

function! VDBKeyUnMap()
    silent! nunmap <C-F5>
    silent! nunmap <F5>
    silent! nunmap <F6>
    silent! nunmap <F7>
    silent! nunmap <F8>
    silent! nunmap <F9>
    silent! nunmap <C-F9>
    silent! nunmap <F10>
    silent! vunmap <F10>
    silent! nunmap <F11>
    silent! vunmap <F11>
endfunction

function! VDBGetJavaFilePackage()
    let l:res = ""
    let l:line_imp = search ('^\s*package\s\+',"nb")
    if  l:line_imp > 0
        let l:str = getline(l:line_imp)
        let l:cend = matchend(l:str,'^\s*package\s\+')
        if  l:cend!= -1
            let l:tmp = matchstr(l:str,".*$",l:cend)
            let l:res =l:res.strpart(l:tmp,0,stridx(l:tmp,";"))
        endif
    endif
    return l:res
endfunction

function! VDBKeyMap()
    call VDBKeyUnMap()
    if match(s:type, "jdb") != -1
        nmap <unique> <C-F5>        :Vdb run<CR>
        nmap <unique> <F5>          :Vdb cont<CR>
        nmap <unique> <F7>          :Vdb step<CR>
        nmap <unique> <F8>          :Vdb next<CR>
        nmap <unique> <F9>          :execute "Vdb stop at " . VDBGetJavaFilePackage() . "." . expand("%:t:r") . ":" . line(".")<CR>
        nmap <unique> <C-F9>        :execute "Vdb clear " . VDBGetJavaFilePackage() . "." . expand("%:t:r") . ":" . line(".")<CR>
        vmap <unique> <F10>         "gy:Vdb print <C-R>g<CR>
        nmap <unique> <F10>         :Vdb print <C-R><C-W><CR>
    elseif match(s:type, "gdb") != -1
        nmap <unique> <C-F5>        :Vdb run<CR>
        nmap <unique> <F5>          :Vdb continue<CR>
        nmap <unique> <F7>          :Vdb step<CR>
        nmap <unique> <F8>          :Vdb next<CR>
        nmap <unique> <F9>          :execute "Vdb break " . bufname("%") . ":" . line(".")<CR>
        vmap <unique> <F10>         "gy:Vdb print <C-R>g<CR>
        nmap <unique> <F10>         :Vdb print <C-R><C-W><CR>
        vmap <unique> <F11>         "gy:Vdb display <C-R>g<CR>
        nmap <unique> <F11>         :Vdb display <C-R><C-W><CR>
    endif
endfunction

" vim:ts=4:sw=4:expandtab:tw=78:ft=vim:fdm=marker:
