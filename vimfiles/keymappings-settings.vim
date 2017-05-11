map <F5> :make<CR>:cw<CR><CR>
map <C-F5> :make clean<CR>:make<CR>:cw<CR><CR>
imap <F5> <ESC>:make<CR>:cw<CR><CR>
imap <C-F5> <ESC>:make clean<CR>:make<CR>:cw<CR><CR>
map <C-n> :NERDTreeToggle<CR>
map <Leader>gs :execute "noautocmd vimgrep /\\<" . expand("<cword>") . "\\>/gj %" <Bar> cw<CR>
map <Leader>gS :execute "noautocmd vimgrep /\\<" . expand("<cword>") . "\\>/gj **/*." . expand("%:e") <Bar> cw<CR>
