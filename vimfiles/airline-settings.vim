""""""""""""""""""""""""""""""""""""""""""""
" The airline configuration
""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('<sfile>:p:h') . '/plugin/airline.vim')
    if has('gui_running')
        if exists('g:airline_powerline_fonts')
                    \ && eval('g:airline_powerline_fonts') == 1
            set guifont=Liberation\ Mono\ for\ Powerline\ Medium\ 10
        else
            if &guifont =~ '.*for Powerline.*'
                let g:airline_powerline_fonts = 1
            else
                let g:airline_left_sep=''
                let g:airline_right_sep=''
            endif
        endif
    else
        let g:airline_left_sep=''
        let g:airline_right_sep=''
    endif
endif
