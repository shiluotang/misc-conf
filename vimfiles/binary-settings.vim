" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre   *.bin let &bin=1
    au BufReadPost  *.bin if &bin | %!xxd
    au BufReadPost  *.bin set ft=xxd | endif
    au BufWritePre  *.bin if &bin | %!xxd -r
    au BufWritePre  *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif

    au!
    au BufReadPre   *.dat let &bin=1
    au BufReadPost  *.dat if &bin | %!xxd
    au BufReadPost  *.dat set ft=xxd | endif
    au BufWritePre  *.dat if &bin | %!xxd -r
    au BufWritePre  *.dat endif
    au BufWritePost *.dat if &bin | %!xxd
    au BufWritePost *.dat set nomod | endif

    au!
    au BufReadPre   *.so let &bin=1
    au BufReadPost  *.so if &bin | %!xxd
    au BufReadPost  *.so set ft=xxd | endif
    au BufWritePre  *.so if &bin | %!xxd -r
    au BufWritePre  *.so endif
    au BufWritePost *.so if &bin | %!xxd
    au BufWritePost *.so set nomod | endif

    au!
    au BufReadPre   *.class let &bin=1
    au BufReadPost  *.class if &bin | %!xxd
    au BufReadPost  *.class set ft=xxd | endif
    au BufWritePre  *.class if &bin | %!xxd -r
    au BufWritePre  *.class endif
    au BufWritePost *.class if &bin | %!xxd
    au BufWritePost *.class set nomod | endif

    au!
    au BufReadPre   *.exe let &bin=1
    au BufReadPost  *.exe if &bin | %!xxd
    au BufReadPost  *.exe set ft=xxd | endif
    au BufWritePre  *.exe if &bin | %!xxd -r
    au BufWritePre  *.exe endif
    au BufWritePost *.exe if &bin | %!xxd
    au BufWritePost *.exe set nomod | endif

    au!
    au BufReadPre   *.o let &bin=1
    au BufReadPost  *.o if &bin | %!xxd
    au BufReadPost  *.o set ft=xxd | endif
    au BufWritePre  *.o if &bin | %!xxd -r
    au BufWritePre  *.o endif
    au BufWritePost *.o if &bin | %!xxd
    au BufWritePost *.o set nomod | endif

    au!
    au BufReadPre   *.lib let &bin=1
    au BufReadPost  *.lib if &bin | %!xxd
    au BufReadPost  *.lib set ft=xxd | endif
    au BufWritePre  *.lib if &bin | %!xxd -r
    au BufWritePre  *.lib endif
    au BufWritePost *.lib if &bin | %!xxd
    au BufWritePost *.lib set nomod | endif

    au!
    au BufReadPre   *.dll let &bin=1
    au BufReadPost  *.dll if &bin | %!xxd
    au BufReadPost  *.dll set ft=xxd | endif
    au BufWritePre  *.dll if &bin | %!xxd -r
    au BufWritePre  *.dll endif
    au BufWritePost *.dll if &bin | %!xxd
    au BufWritePost *.dll set nomod | endif

augroup END
