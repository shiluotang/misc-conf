"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javacomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('<sfile>:p:h') . '/plugin/javacomplete.vim')
    if has("autocmd")
        autocmd filetype java setlocal omnifunc=javacomplete#Complete
        autocmd filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
        autocmd filetype java inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
        autocmd filetype java inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
    endif
endif
