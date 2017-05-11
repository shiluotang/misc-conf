"----------------------------------
" airline settings
"----------------------------------
if (has("unix") && filereadable(expand("$HOME/.vim/plugin/airline.vim"))) || (has("win32") && filereadable(expand("$HOME/vimfiles/plugin/airline.vim")))
    let g:airline#extensions#branch#use_vcscommand = 1
    let g:airline#extensions#eclim#enabled = 1
    if has("gui_running")
        "let g:airline_theme = 'base16_codeschool'
        "colorscheme colorer
        let g:airline_powerline_fonts = 0
        if exists("g:airline_powerline_fonts") && eval("g:airline_powerline_fonts") == 1
            "set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 15
            set guifont=Liberation\ Mono\ for\ Powerline\ Medium\ 10
        else
            set guifont=Courier\ 10
        endif
    endif
endif
