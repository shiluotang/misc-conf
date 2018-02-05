""""""""""""""""""""""""""""""""""""""""""""
" The airline configuration
""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('<sfile>:p:h') . '/plugin/airline.vim')
    let g:airline#extensions#branch#use_vcscommand = 1
    let g:airline#extensions#eclim#enabled = 1
    if has('gui_running')
        if exists('g:airline_powerline_fonts')
                    \ && eval('g:airline_powerline_fonts') == 1
            "set guifont=Source\ Code\ Pro\ for\ Powerline:h14
            "set guifont=Liberation\ Mono\ for\ Powerline\ Medium\ 10
            set guifont=Cousine\ for\ Powerline:h12
        else
            if &guifont =~ '.*for Powerline.*'
                let g:airline_powerline_fonts = 1
            else
                let g:airline_powerline_fonts = 0
                if has('win32')
                    set guifont=Courier:h12:cANSI
                elseif has('mac')
                    set guifont=Courier:h12,Monaco:h12
                    "set guifontwide=楷体:h12
                elseif has('unix')
                    set guifont=Courier\ 10,Courier\ 10\ Pitch\ 10
                endif
                let g:airline_left_sep=''
                let g:airline_right_sep=''
            endif
        endif
    else
        let g:airline_powerline_fonts = 0
        let g:airline_left_sep=''
        let g:airline_right_sep=''
    endif
endif
