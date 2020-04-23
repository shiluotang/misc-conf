" Vim compiler file
" Compiler:	maven
" Maintainer:	Joseph H. Yao (hyao@sina.com)
" Last Change:	2013年11月11日 17:59:07

if exists("current_compiler")
  finish
endif
let current_compiler = "maven"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" default errorformat
" This is for maven (maven-compiler-plugin:2.5.1, maven-javadoc-plugin:2.10.1)
" maven-compiler-plugin 3.1 has too many bugs.
CompilerSet errorformat=
            \[%tRROR]\ %#Malformed\ POM\ %f:\ %m@%l:%c%.%#,
            \[%tRROR]\ %#Non-parseable\ POM\ %f:\ %m\ %#\\@\ line\ %l\\,\ column\ %c%.%#,
            \[%t%[A-Z]%#]\ %f:[%l]\ %m,
            \[%[A-Z]%#]\ %f:[%l\\,%c]\ %t%[a-z]%#:\ %m,
            \[%t%[A-Z]%#]\ %f:[%l\\,%c]\ %[%^:]%#:\ %m,
            \[%t%[A-Z]%#]\ %f:[%l\\,%c]\ %m,
            \%A[%[A-Z]%#]\ Exit\ code:\ %[0-9]%#\ -\ %f:%l:\ %m,
            \%A[%[A-Z]%#]\ %f:%l:\ %m,
            \%-Z[%[A-Z]%#]\ %p^,
            \%C[%[A-Z]%#]\ %#%m

" default make
CompilerSet makeprg=mvn

function JUnitOne()
    let s:needle = 'src.test.java.'
    let s:casename = expand('<cword>')
    let s:abspath = expand('%:p:r')
    let s:abspath = substitute(substitute(s:abspath, '/', '.', 'g'), '\', '.', 'g')
    let s:pos = strridx(s:abspath, s:needle)
    if s:pos != -1
        let s:clazz = strpart(s:abspath, s:pos + strlen(s:needle))
        "echo 'make test -DfailIfNoTests=false -Dtest=' . s:clazz . '#' . s:casename
        let s:code = 'make test -DfailIfNoTests=false -Dtest=' . s:clazz . '\#' . s:casename
        execute s:code
    endif
endfunction

map <F5> :make compile test-compile<CR>
imap <F5> <ESC>:make compile test-compile<CR>
map <C-F5> :make clean compile test-compile<CR>
imap <C-F5> <ESC>:make clean compile test-compile<CR>
map <C-F11> :make -q exec:java<CR>
imap <C-F11> :make -q exec:java<CR>
map <F9> :call JUnitOne()<CR>
imap <F9> :call JUnitOne()<CR>
