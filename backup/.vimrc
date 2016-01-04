if !exists("g:pathogen_disabled")  
 let g:pathogen_disabled = []
endif
call add(g:pathogen_disabled, 'vorax4-beta')    "1
call add(g:pathogen_disabled, 'nerdtree')       "2

if match($VORAX, "true") == -1
 call add(g:pathogen_disabled, 'vorax')         "11
endif

"vim-session plugin
let g:session_directory = '/home/mbedna'
let g:session_autosave = 'no'

"NERDTree
let g:NERDTreeDirArrows=0
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeChDirMode = 2

" returns true iff is NERDTree open/active
function! rc:isNTOpen()        
 return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true iff focused window is NERDTree window
function! rc:isNTFocused()     
    return -1 != match(expand('%'), 'NERD_Tree') 
endfunction 

" returns true iff focused window contains a file in current pwd
function! rc:isInsideCwd()
    return -1 != stridx(expand('%:p'), getcwd())
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! rc:syncTree()
    if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff && rc:isInsideCwd()
        NERDTreeFind
        wincmd p
    endif
endfunction

autocmd BufEnter * call rc:syncTree()

"Eclim
let g:EclimDisabled = 1
let g:EclimProjectTabTreeAutoOpen = 0 
command! -nargs=1 -bang
    \ -complete=customlist,eclim#project#util#CommandCompleteProject
    \ ProjectSelect :call <SID>ProjectSelect('<args>')
function! s:ProjectSelect(project)
    exec 'ProjectTab ' . a:project
    NERDTree
endfunction 

let g:EclimMakeLCD = 1

let g:EclimProjectTreeActions = [
    \ {'pattern': '.*', 'name': 'Edit', 'action': 'edit'},
    \ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'},
    \ {'pattern': '.*', 'name': 'Split', 'action': 'split'},
  \ ]
let g:EclimJavaSearchSingleResult = 'edit'

command! Mci execute "Mvn clean install"
command! Mt execute "Mvn test"
command! Mee execute "Mvn eclipse:eclipse -DdownloadSources -DdownloadJavadocs"
command! Mec execute "Mvn eclipse:clean"
cabbrev mee Mee
cabbrev mec Mec
cabbrev mci Mci
cabbrev mt Mt

nnoremap <silent> <buffer> <leader>jds :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <leader>jj :Java %<cr>
nnoremap <silent> <buffer> <leader>jc :JavaCorrect<cr>
nnoremap <silent> <buffer> <leader>jr :JavaRename<cr>
nnoremap <silent> <buffer> <leader>jm :JavaMove<cr>
nnoremap <silent> <buffer> <leader>jf :%JavaFormat<cr>
nnoremap <silent> <buffer> <leader>ji :JavaImportOrganize<cr>
nnoremap <silent> <buffer> <leader>jsc :JavaSearchContext<cr>
nnoremap <silent> <buffer> <leader>ju :JUnit<cr>
nnoremap <silent> <buffer> <leader>jt :JUnit %<cr>
nnoremap <silent> <buffer> <leader>jT :JUnit *<cr>

"Vorax
let g:vorax_debug = 0
let g:vorax_output_window_size=10
let g:vorax_limit_rows=100
au! BufRead,BufNewFile *.pck set filetype=plsql
let g:vorax_debug_level='ALL'

let g:vorax_explorer_file_extensions = {'PACKAGE' : 'pck',
                                        \ 'PACKAGE_SPEC' : 'spc',
                                        \ 'PACKAGE_BODY' : 'bdy',
                                        \ 'FUNCTION' : 'fnc',
                                        \ 'PROCEDURE' : 'prc',
                                        \ 'TRIGGER' : 'trg',
                                        \ 'TYPE' : 'typ',
                                        \ 'TYPE_SPEC' : 'tps',
                                        \ 'TYPE_BODY' : 'tpb',}
"Netrw
"let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " Preview window shown in vertical split
let g:netrw_winsize=30 " when you preview the new file takes up 80% and the file explorer the other 20
let g:netrw_hide=1
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv=1
let g:netrw_keepdir = 1
"set splitright

" Toggle Vexplore with Ctrl-E
"function! ToggleVExplorer()
"  if exists("t:expl_buf_num")
"      let expl_win_num = bufwinnr(t:expl_buf_num)
"      if expl_win_num != -1
"          let cur_win_nr = winnr()
"          exec expl_win_num . 'wincmd w'
"          close
"          exec cur_win_nr . 'wincmd w'
"          unlet t:expl_buf_num
"      else
"          unlet t:expl_buf_num
"      endif
"  else
"      exec '1wincmd w'
"      Vexplore
"      let t:expl_buf_num = bufnr("%")
"  endif
"endfunction
"map <silent> <C-E> :call ToggleVExplorer()<CR>

