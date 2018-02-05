"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('<sfile>:p:h') . '/plugin/NERD_tree.vim')
    "let java_highlight_functions ='style'
    "nerd tree plugin
    if has("win32") || has("win64")
        let NERDTreeDirArrows=0
    endif
    map <C-n> :NERDTreeToggle<CR>
endif
