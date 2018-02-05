syntax on
set number
set ruler
" always
set laststatus=2
if version >= 700
    set colorcolumn=+1
endif
if version >= 800
    set scrolloff=0
endif

if has("autocmd")
    filetype plugin indent on
    autocmd filetype java   setlocal textwidth=80 formatoptions+=tm
    autocmd filetype c      setlocal syntax=c.doxygen
    autocmd filetype cpp    setlocal syntax=cpp.doxygen
    autocmd filetype php    setlocal syntax=php.doxygen
    autocmd filetype idl    setlocal syntax=idl.doxygen
endif

" doxygen syntax
" This will conflict with javadoc rendering in vim.
"let g:load_doxygen_syntax = 1

"java syntax
let java_allow_cpp_keywords = 0
let java_highlight_java_lang_ids = 1
let java_highlight_java_io = 1
"let java_highlight_functions ='indent'

"taglist plugin
let Tlist_Show_One_File = 1

"colorscheme molokai fix
let g:molokai_original = 1

compiler!gcc
