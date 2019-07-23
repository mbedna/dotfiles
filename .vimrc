if has("gui_running")
  source C:/programs/vim73/vim73/runtime/bundle/vim-pathogen/autoload/pathogen.vim
else 
  runtime bundle/vim-pathogen/autoload/pathogen.vim
endif

set nocompatible
filetype plugin on

if !exists("g:pathogen_disabled")  
" let g:pathogen_disabled = ['tern_for_vim', 'vim-indent-guides', 'vim-fugitive', 'vim-javascript', 'vim-javascript-syntax', 'syntastic' ]
 let g:pathogen_disabled = ['vim-css-color']
endif
call add(g:pathogen_disabled, 'vdebug')

"Pathogen
call pathogen#infect() 
call pathogen#helptags()


" Source the vimrc file after saving it
if has("gui_running")
 set guioptions+=b
 autocmd bufwritepost _vimrc source $MYVIMRC
 au GUIEnter * simalt ~x "x on an English Windows version. n on a French one
 set guicursor+=a:blinkon0
else
 autocmd bufwritepost .vimrc source $MYVIMRC
endif

"Use javascript formatting for json files
autocmd BufNewFile,BufRead *.json set ft=javascript

"for mksession
"set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds

"Screen plugin
let g:ScreenShellHeight=10
let g:ScreenImpl = 'GnuScreen'
let g:ScreenShellSession = 'paws'
let g:ScreenShellAttachTargetCurrent = 1
let g:ScreenShellQuitOnVimExit = 1
let g:ScreenShellWidth = -1
let g:ScreenShellGnuScreenVerticalSupport = 'patch'

function! s:ScreenShellListener()
    if g:ScreenShellActive
      nmap <C-c><C-c> :ScreenSend<cr>
      nmap <C-c><C-x> :ScreenQuit<cr>
    else
      nmap <C-c><C-c> :ScreenShell<cr>
    endif
  endfunction

nmap <C-c><C-c> :ScreenShell<cr>
augroup ScreenShellEnter
  autocmd User * call <SID>ScreenShellListener()
augroup END
augroup ScreenShellExit
  autocmd User * call <SID>ScreenShellListener()
augroup END

"Netrw
let g:netrw_banner=0
let g:netrw_liststyle=3 " Use tree-mode as default view
if exists("g:netrw_local_rmdir")
    let g:netrw_local_rmdir="rm -rf"
endif
if exists("g:netrw_localrmdir")
    let g:netrw_localrmdir="rm -rf"
endif

" CtrlP configuration
"let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_height = 20 
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.settings$\|\.hg$\|\.svn$\|tags\|bin\|target\|\.git$\|fitnesse$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.classpath\|\.project$\|\.class\|\.jar\|\.springBeans\|\.png\|\.gif\|\.war\|tags\|\.ctrlp',
  \ 'link': 'some_bad_symbolic_links'
  \ }
"CtrlP to always open in your project's root directory. Look for .ctrlp file.
let g:ctrlp_working_path_mode = 2
let g:ctrlp_open_new_file = 'v'

" Set the max files
let g:ctrlp_max_files = 5000

if has("unix")
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
                \ },
                \ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
                \ }
endif
"When ctrlp_arg_map is set to 1, the <c-o> and <c-y> mappings will accept one extra key as an argument to override their default behavior
"Pressing <c-o> or <c-y> will then prompt for a keypress. The key can be:
"  t - open in tab(s)
"  h - open in horizontal split(s)
"  v - open in vertical split(s)
"  i - open as hidden buffers (for <c-o> only)
"  c - clear the marked files (for <c-o> only)
"  r - open in the current window (for <c-y> only)
"  <esc>, <c-c>, <c-u> - cancel and go back to the prompt.
"  <cr> - use the default behavior specified with |g:ctrlp_open_new_file| and
"  |g:ctrlp_open_multiple_files|.
let g:ctrlp_arg_map = 1
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_tabpage_position = 'ac'


" Open markdown files with Firefox.
autocmd BufEnter *.md,*.html exe 'noremap <F5> :!firefox $(cygpath -w %:p)<CR>'

"Vdebug
"let g:vdebug_options["timeout"]=300

"\    "server" : 'didactus.app.didactus.dev',
"\    "server" : 'localhost',

"let g:vdebug_options= {
"\    "port" : 9000,
"\    "server" : 'localhost',
"\    "timeout" : 300,
"\    "on_close" : 'detach',
"\    "break_on_open" : 0,
"\    "ide_key" : '',
"\    "path_maps" : {},
"\    "debug_window_level" : 0,
"\    "debug_file_level" : 0,
"\    "debug_file" : "",
"\    "watch_window_style" : 'expanded',
"\    "marker_default" : '⬦',
"\    "marker_closed_tree" : '▸',
"\    "marker_open_tree" : '▾'
"\}

"Syntastic
"Always compile project first np. with mcc and mtc !!!!!!!!!!!!!!!
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

let g:syntastic_debug = 0
let g:syntastic_java_javac_delete_output = 0
"let g:syntastic_java_checkers=['javac', 'checkstyle']
let g:syntastic_java_checkers=['']
let g:syntastic_loc_list_height = 10
let g:syntastic_auto_loc_list = 1
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_java_javac_autoload_maven_classpath = 0

if match($TERM, "screen")!=-1
  set term=xterm-256color
endif

set backspace=2 " make backspace work like most other apps
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set encoding& "terminal charset: follows current locale
set termencoding=
set fileencodings= " charset auto-sensing: disabled
set fileencoding& " auto-sensed charset of current buffer
if has('win32unix')
 set fileformat=unix
 set fileformats=unix,dos
endif

" Status Line {  
 set laststatus=2                             "always show statusbar  
 set statusline=  
 set statusline+=%-10.3n\                     "buffer number  
 set statusline+=%f\         " filename   
 set statusline+=%h%m%r%w    " status flags  
 set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
 set statusline+=%= " right align remainder  
 set statusline+=0x%-8B " character value  
 set statusline+=%-14(%l,%c%V%) " line, character  
 set statusline+=%<%P " file position 
"}  

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

com! Clfx call setqflist([]) 
" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

" Function that does the work
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as 
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
endif



"""""""""" ctags """"""""""
 
"Save ctags manually
if has("gui_running")
 au BufWritePost *.java silent! !start ctags --append -R
 au! FileType java set tags=tags,C:\\Java\\jdk1.6.0_29\\share\tags;
elseif has('win32unix') 
 au BufWritePost *.java,*.vim,*.gant,*.php,*.rb silent! !ctags --append -R 2>/dev/null &
 au! FileType java,vim,gant,php,ruby set tags=tags,$JAVA_HOME/share/tags,/;
elseif has('unix') && !has('win32unix')
 au BufWritePost *.java,*.vim,*.gant,*.php,*.rb silent! !ctags --append -R 2>/dev/null &
 au! FileType java,vim,gant,php,ruby set tags=./tags,tags,/opt/tools/sources/java-8-sources/tags
endif

"run java commands
"autocmd Filetype java set makeprg=javac\ %
"set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"map <F9> :make<Return>:copen<Return>

set path=**
set suffixesadd=.php
set includeexpr=substitute(v:fname,'\\\','/','g') 

set hidden
set ic
set wrap
set linebreak
set wildmode=longest,list
set wildmenu
set wildignore+=tmp\*,*.swp,*.zip,*.exe,*\.settings\*,\.classpath,\.project,*.class,\.springBeans,bin\*,target\*,*.jar,*\.git\*
set number
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
let mapleader=","
let g:loaded_matchparen = 1
let &showbreak = '+++ '

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

" no backup and no swap
set nobackup
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

nnoremap <silent> TT :TagbarToggle<cr>

set pastetoggle=<F2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('unix') && !has('win32unix') && executable("gconftool-2")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

"if has('win32unix') && (&term == "screen-bce")
" let &t_SI .= "\eP\e[6 q\e\\"
" let &t_EI .= "\eP\e[2 q\e\\"
"elseif has('win32unix') && (&term == "cygwin")
" let &t_SI="\e[6 q"
" let &t_EI="\e[2 q"
"endif
"set timeoutlen=700
"let &t_ti="\e[2 q\e[?1049h"
"let &t_te="\e[0 q\e[?1049l"
"  if &term =~ "xterm\\|rxvt"
" " use an orange cursor in insert mode
" let &t_SI = "\<Esc>]12;orange\x7"
" " use a red cursor otherwise
" let &t_EI = "\<Esc>]12;red\x7"
" silent !echo -ne "\033]12;red\007"
" " reset cursor when vim exits
" autocmd VimLeave * silent !echo -ne "\033]112\007"
" " use \003]12;gray\007 for gnome-terminal
"  endif
syntax enable

"Highlight color changed. Standard was too dark.
:hi Search ctermbg=8
:hi Visual ctermbg=0
:hi Pmenu ctermfg=1 ctermbg=0
:hi PmenuSel ctermfg=2 ctermbg=0
"if has('win32unix')
"  :hi Search ctermbg=7
"elseif has('unix')
"  :hi Search ctermbg=0
"  :hi Visual ctermbg=0
"  :hi Pmenu ctermfg=1 ctermbg=0
"  :hi PmenuSel ctermfg=2 ctermbg=0
"endif

if has("gui_running")
 set t_Co=256
 let g:solarized_contrast="high"
 let g:solarized_termcolors=256
 let g:solarized_visibility="high"
 set background=light
 let g:solarized_termtrans=0
 colorscheme solarized 
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"copy to clipboard
map <leader>y "*y

"paste to clipboard
map <leader>p "*p
map <leader>P "*P
nmap <leader>. :e $MYVIMRC<CR>
nnoremap <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> > :exe "vertical resize" (winwidth(0)*5/4)<CR>
nnoremap <silent> < :exe "vertical resize" (winwidth(0)*4/5)<CR>

nmap <leader>r :redraw!<CR>

" Replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Clear the search buffer when hitting return
" nnoremap <CR> :nohlsearch<cr>

nmap <leader>l :set list!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
"map <silent> h <Nop>
"map <silent> l <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

map <leader>n :call RenameFile()<cr>

map <leader>T :w\|:call RunTests()<cr>
map <leader>t :w\|:call RunTest()<cr>
map <leader>u :w\|:call RunOneTest()<cr>
map <leader>m :w\|:call RunMavenMain()<cr>

"map <leader>c :w\|:!script/features<cr>
"map <leader>w :w\|:!script/features --profile wip<cr>

function! DeleteFile(...)
  if(exists('a:1'))
    let theFile=a:1
  elseif ( &ft == 'help' )
    echohl Error
    echo "Cannot delete a help buffer!"
    echohl None
    return -1
  else
    let theFile=expand('%:p')
  endif
  let delStatus=delete(theFile)
  if(delStatus == 0)
    echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction
"delete the current file
com! Rm call DeleteFile()
"delete the file and quit the buffer (quits vim if this was the last file)
com! RM call DeleteFile() <Bar> q!
"ignore whitespaces
"set diffopt+=iwhite


"function! TabLine()
"  let line = ''
"  for i in range(tabpagenr('$'))
"    let n = i + 1
"    " select the highlighting
"    let line .= tabpagenr() == n ? '%#TabLineSel#' : '%#TabLine#'
"    " create the tab label
"    let buflist = tabpagebuflist(n)
"    let winnr = tabpagewinnr(n)
"    let name = fnamemodify(bufname(buflist[winnr - 1]), ':t')
"    let status = gettabwinvar(n, winnr, '&statusline')
"    if status =~ '^\w\{3,}'
"      let name = status
"    endif
"    let line .= ' %{"' . (name != '' ? name : '[No Name]') . '"} '
"    if n > 0 && n != tabpagenr('$')
"      let line .= '%#TabLine# | '
"    endif
"  endfor
"  " after the last tab fill with TabLineFill and reset tab page nr
"  let line .= '%#TabLineFill#%T'
"  return line
"endfunction
"set tabline=%!TabLine()
"function! GuiTabLabel()
"     return substitute( expand( '%:p' ), '.\+\/\(.\+\)\/.\+', '\1', '' )
" endfunction
" set guitablabel=%{GuiTabLabel()}
"set tabline=%{GuiTabLabel()}
"Rename tabs to show tab# and # of viewports

if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
            let s .= i
            if tabpagewinnr(i,'$') > 1
                let s .= '.'
                let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')
                let s .= (tabpagewinnr(i,'$') > 1 ? wn : '')
            end

            let s .= ' %*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let file_path = fnamemodify(file, ':p')
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            let current_dir = substitute(file_path, '.\+\/\(.\+\)\/.\+', '\1', '' )
            if file == ''
                let file = '[No Name]'
                let current_dir = substitute(file_path, '.\+\/\(.\+\)', '\1', '' )
            endif
            let s .= current_dir.' - '
            let s .= file
            let s .= (i == t ? '%m' : '')
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif

" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')
cnoremap <expr> bfda 'bufdo bdelete'

"Format JSON
function! FormatJSON()
    :%!python -m json.tool
endfunction

nnoremap <silent> <buffer> <leader>f :call FormatJSON()<cr>
