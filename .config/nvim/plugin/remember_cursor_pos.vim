augroup cursorpos
    autocmd!
augroup END

autocmd cursorpos BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
