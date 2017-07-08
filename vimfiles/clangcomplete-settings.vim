""""""""""""""""""""""""""""""""""""""""""""
" clang complete settings
""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('<sfile>:p:h') . '/plugin/clang_complete.vim')
    "let g:clang_user_options = "-std=c++11"
    let g:clang_complete_macros = 1
    if exists("$LLVM_HOME")
        if has("win32")
            if filereadable(expand('$LLVM_HOME/bin/libclang.dll'))
                let g:clang_use_library = 1
                let g:clang_library_path = expand("$LLVM_HOME/bin/libclang.dll")
            endif
        endif
    else
        let g:clang_versions = [ '4.0', '3.9', '3.8', '3.7', '3.6', '3.5', '3.4' ]
        if !has("win32")
            for g:clang_version in g:clang_versions
                let g:clang_library_path = '/usr/lib/llvm-' . g:clang_version . 'lib/libclang.so'
                if filereadable(g:clang_library_path)
                    let g:clang_use_library = 1
                    break
                else
                    unlet g:clang_library_path
                endif
            endfor
        endif
        "let g:clang_complete_loaded = 1
    endif
endif

if has("autocmd")
    if has("unix")
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
    elseif has("win32")
        if exists("$LLVM_HOME")
            let g:clang_format = expand('$LLVM_HOME/bin/clang-format.exe')
            if executable(g:clang_format)
                autocmd filetype c,cpp,objc,objcpp let &l:formatprg=g:clang_format
                autocmd filetype c,cpp,objc,objcpp let &l:equalprg=g:clang_format
            endif
        endif
    endif
endif
