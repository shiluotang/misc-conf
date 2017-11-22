if has('cscope')
    let g:cscope = &cscopeprg
    " set csprg
    if exists('$CSCOPE') && executable(expand('$CSCOPE'))
        let g:cscope = expand('$CSCOPE')
    elseif g:cscope == '' && executable(system('which cscope'))
        let g:cscope = system('which cscope')
    endif

    if g:cscope != ''
        let &csprg=g:cscope
        set csto=0
        set cst
        set nocsverb
        if filereadable('cscope.out')
            cs add cscope.out
        elseif $CSCOPE_DB != ''
            cs add $CSCOPE_DB
        endif
        set csverb
        nmap <Leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <Leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <Leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <Leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <Leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <Leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <Leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <Leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
        nmap <Leader>sa :cs find a <C-R>=expand("<cword>")<CR><CR>
        set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
    endif
endif
