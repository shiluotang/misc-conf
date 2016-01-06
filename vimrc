set nocompatible

if (&term == "xterm") || (&term == "screen")
    let &t_Co=256
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
    let &t_Sb="\e[4%dm"
    let &t_Sf="\e[3%dm"
endif

if has("win32") || has("win64")
    set runtimepath=$HOME/.vim
    set runtimepath+=$VIM/vimfiles
    set runtimepath+=$VIMRUNTIME
    set runtimepath+=$VIM/vimfiles/after
    set runtimepath+=$HOME/.vim/after
endif

source $VIMRUNTIME/vimrc_example.vim
if has("win32") || has("win64")
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

if has("multi_byte")
    set fileencodings&
    set fileencodings-=latin1
    set fileencodings-=default
    set fileencodings-=utf-8
    set fileencodings-=ucs-bom

    set fileencodings+=ucs-bom
    set fileencodings+=utf-8
    set fileencodings+=chinese
    set fileencodings+=japanese
    set fileencodings+=korean
    set fileencodings+=default
    set fileencodings+=latin1
endif

syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=+1

set laststatus=2 " always
if has("statusline")
    set statusline =                                                                                        " clear
    set statusline+=%<%f                                                                                    " file full path, truncate
    set statusline+=\ %h                                                                                    " help flag '[Help]'
    set statusline+=[%{&ff}]                                                                                " [fileformat]
    set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}    " fileencoding
    set statusline+=%m                                                                                      " modified flag '[+]' if modifiable
    set statusline+=%r                                                                                      " read only flag '[RO]'
    set statusline+=%=                                                                                      " left/right separation point
    set statusline+=%-14.(%l,%c%V%)                                                                         " cursor coordinate in file
    set statusline+=\ %P                                                                                    " percent of file{4} Top | n% | Bot
endif 
if has("cscope") && filereadable("/usr/bin/cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
set cscopequickfix=c-,d-,e-,f-,g-,i-,s-,t-

if has("autocmd") && has("multi_byte") && has("iconv")
    "au QuickfixCmdPost make call QfMakeConv()
endif

if has("autocmd")
    " textwidth
	autocmd filetype java setlocal textwidth=80 formatoptions+=tm
endif

"javacomplete
"if has("autocmd")
"	autocmd filetype java setlocal omnifunc=javacomplete#Complete
"	autocmd filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
"	autocmd filetype java inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"	autocmd filetype java inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
"endif

" eclim settings
"if has("autocmd")
"    autocmd filetype java map <buffer> <LocalLeader>es :JavaSearch<CR>
"    autocmd filetype java map <buffer> <LocalLeader>eS :JavaSearchContext<CR>
"    autocmd filetype java map <buffer> <LocalLeader>ef :JavaFormat<CR>
"    autocmd filetype java map <buffer> <LocalLeader>eF :%JavaFormat<CR>
"    autocmd filetype java map <buffer> <LocalLeader>ei :JavaImport<CR>
"    autocmd filetype java map <buffer> <LocalLeader>eI :JavaImportOrganize<CR>
"    autocmd filetype java map <buffer> <LocalLeader>ed :JavaDocSearch <CR>
"    autocmd filetype java map <buffer> <LocalLeader>eh :JavaHierarchy<CR>
"    autocmd filetype java map <buffer> <LocalLeader>ec :JavaCallHierarchy<CR>
"    autocmd filetype java map <buffer> <LocalLeader>eC :JavaCallHierarchy!<CR>
"    autocmd filetype java map <buffer> <LocalLeader>ev :Validate<CR>
"
"    " add bean methods
"    autocmd filetype java map <buffer> <LocalLeader>eba :JavaGetSet<CR>
"    autocmd filetype java map <buffer> <LocalLeader>ebg :JavaGet<CR>
"    autocmd filetype java map <buffer> <LocalLeader>ebs :JavaSet<CR>
"
"    " other things
"	autocmd filetype java setlocal textwidth=80 formatoptions+=tm
"endif
"" disable eclim all languages validation
"let g:EclimFileTypeValidate = 0

function QfMakeConv()
    let qflist = getqflist()
    for i in qflist
        let i.text = iconv(i.text, "cp936", &enc)
    endfor
    call setqflist(qflist)
endfunction

map <F5> :make<CR>:cw<CR><CR>
map <C-F5> :make clean<CR>:make<CR>:cw<CR><CR>
imap <F5> <ESC>:make<CR>:cw<CR><CR>
imap <C-F5> <ESC>:make clean<CR>:make<CR>:cw<CR><CR>

"doxygen syntax
"let g:load_doxygen_syntax = 1
"java syntax
let java_allow_cpp_keywords = 0
let java_highlight_java_lang_ids = 1
"let java_highlight_functions ='style'
"nerd tree plugin
let NERDTreeDirArrows=0
map <C-n> :NERDTreeToggle<CR>
"taglist plugin
let Tlist_Show_One_File = 1

let g:clang_user_options="-std=c++11"
let g:clang_complete_macros = 1
if exists("$LLVM_HOME")
    let g:clang_use_library = 1
    let g:clang_library_path = expand("$LLVM_HOME/bin")
else
    let g:clang_use_library = 1
    let g:clang_library_path = '/usr/lib/llvm-3.5/lib/libclang.so'
    "let g:clang_complete_loaded = 1
endif

"compiler!gcc

let g:molokai_original = 1

" map vimgrep
map <Leader>gs :execute "noautocmd vimgrep /\\<" . expand("<cword>") . "\\>/gj %" <Bar> cw<CR>
map <Leader>gS :execute "noautocmd vimgrep /\\<" . expand("<cword>") . "\\>/gj **/*." . expand("%:e") <Bar> cw<CR>

if has("gui_running")
    "set guifont=Courier\ New:h9:cANSI
    "colorscheme solarized
    "colorscheme default
else
    "colorscheme solarized
    set background=dark
endif
