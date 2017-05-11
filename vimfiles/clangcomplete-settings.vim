" clang complete

let g:clang_complete_macros = 1
if exists("$LLVM_HOME")
    let g:clang_use_library = 1
    let g:clang_library_path = expand("$LLVM_HOME/bin")
else
    let g:clang_use_library = 1
    let g:clang_library_path = "/usr/lib/llvm-3.4/lib"
    "let g:clang_library_path = "/usr/lib/llvm-3.5/lib"
    "let g:clang_library_path = "/usr/lib/llvm-3.6/lib"
    "let g:clang_library_path = "/usr/lib/llvm-3.8/lib"
    "let g:clang_complete_loaded = 1
endif

let g:clang_user_options = ''
" Standard c++11, gnu++11, c++0x, gnu++0x, c++98, gnu++98
"let g:clang_user_options = g:clang_user_options . ' -std=c++11'

" Linux GCC
"let g:clang_user_options = g:clang_user_options . ' -I/usr/local/include/x86_64-linux-gnu'
"let g:clang_user_options = g:clang_user_options . ' -I/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../x86_64-linux-gnu/include'
let g:clang_user_options = g:clang_user_options . ' -I/usr/lib/gcc/x86_64-linux-gnu/4.8/include'
let g:clang_user_options = g:clang_user_options . ' -I/usr/local/include'
let g:clang_user_options = g:clang_user_options . ' -I/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed'
let g:clang_user_options = g:clang_user_options . ' -I/usr/include/x86_64-linux-gnu'
let g:clang_user_options = g:clang_user_options . ' -I/usr/include'

" JNI
let g:clang_user_options = g:clang_user_options . ' -I/usr/lib/jvm/default-java/include'
let g:clang_user_options = g:clang_user_options . ' -I/usr/lib/jvm/default-java/include/linux'
