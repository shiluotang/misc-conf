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
    " Java textwidth
	autocmd filetype java setlocal textwidth=80 formatoptions+=tm
    filetype plugin indent on
endif

" doxygen syntax
let g:load_doxygen_syntax = 1
" Java syntax
let java_allow_cpp_keywords = 0
let java_highlight_java_lang_ids = 1
let java_highlight_java_io = 1
"let java_highlight_functions ='indent'

"taglist plugin
let Tlist_Show_One_File = 1
" molokai scheme
let g:molokai_original = 1
