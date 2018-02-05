""""""""""""""""""""""""""""""""""""""""""""
" clang complete settings
""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('<sfile>:p:h') . '/plugin/clang_complete.vim')
    " These options could be place inside $HOME/.clang_complete
    let g:clang_user_options = ''
    let g:clang_user_options = g:clang_user_options . " -DHAVE_DEBUG_H"
    if has('mac')
        let g:clang_user_options = g:clang_user_options . " -I/usr/include/c++/v1"
        let g:clang_user_options = g:clang_user_options . " -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1"
        let g:clang_user_options = g:clang_user_options . " -I/usr/local/include"
        let g:clang_user_options = g:clang_user_options . " -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/user/bin/../lib/clang/8.0.0/include"
        let g:clang_user_options = g:clang_user_options . " -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/user/include"
        let g:clang_user_options = g:clang_user_options . " -I/usr/include"
        let g:clang_user_options = g:clang_user_options . " -I/System/Library/Frameworks"
        let g:clang_user_options = g:clang_user_options . " -I/Library/Frameworks"
        let g:clang_user_options = g:clang_user_options . " -I/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home/include"
        let g:clang_user_options = g:clang_user_options . " -I/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home/include/darwin"
    endif

    let g:clang_complete_macros = 1
    if exists('$LLVM_HOME')
        if has('win32')
            if filereadable(expand('$LLVM_HOME/bin/libclang.dll'))
                let g:clang_use_library = 1
                let g:clang_library_path = expand('$LLVM_HOME/bin/libclang.dll')
            endif
        else
            if isdirectory(expand('$LLVM_HOME/bin'))
                let g:clang_use_library = 1
                let g:clang_library_path = expand("$LLVM_HOME/bin")
            endif
        endif
    else
        if has('mac')
            "let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
            let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
            if filereadable(g:clang_library_path . '/' . 'libclang.dylib')
                let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
                let g:clang_use_library = 1
            else
                unlet g:clang_library_path
                let g:clang_use_library = 0
            endif
        else
            let g:clang_library_paths = [
                        \ '/usr/lib/llvm-3.9/lib',
                        \ '/usr/lib/llvm-3.8/lib',
                        \ '/usr/lib/llvm-3.7/lib',
                        \ '/usr/lib/llvm-3.6/lib',
                        \ '/usr/lib/llvm-3.5/lib',
                        \ '/usr/lib/llvm-3.4/lib',
                        \ ]
            if has('unix')
                for g:clang_library_path in g:clang_library_paths
                    if filereadable(g:clang_library_path . '/' . 'libclang.so')
                        let g:clang_use_library = 1
                        break
                    else
                        let g:clang_use_library = 0
                        unlet g:clang_library_path
                    endif
                endfor
            endif
        endif
        "let g:clang_complete_loaded = 1
    endif
endif

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
