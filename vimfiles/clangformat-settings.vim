if has('autocmd')
    if has('unix')
        let g:clang_formats = [
                    \ '/usr/lib/llvm-3.9/bin/clang-format',
                    \ '/usr/lib/llvm-3.8/bin/clang-format',
                    \ '/usr/lib/llvm-3.7/bin/clang-format',
                    \ '/usr/lib/llvm-3.6/bin/clang-format',
                    \ '/usr/lib/llvm-3.5/bin/clang-format',
                    \ '/usr/lib/llvm-3.4/bin/clang-format',
                    \ ]
        for g:clang_format in g:clang_formats
            if executable(g:clang_format)
                autocmd filetype c,cpp,objc,objcpp let &l:formatprg=g:clang_format
                autocmd filetype c,cpp,objc,objcpp let &l:equalprg=g:clang_format
                break
            endif
        endfor
    elseif has('win32')
        if exists('$LLVM_HOME')
            let g:clang_format = expand('$LLVM_HOME/bin/clang-format.exe')
            if executable(g:clang_format)
                autocmd filetype c,cpp,objc,objcpp let &l:formatprg=g:clang_format
                autocmd filetype c,cpp,objc,objcpp let &l:equalprg=g:clang_format
            endif
        endif
    endif
endif
