
function! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! g/^\_s*\%$/d
    call setpos('.', save_cursor)
endfunction

augroup trim
    autocmd!
    autocmd trim BufWritePre * :%s/\s\+$//e  " Remove trailing whitespace on save
    autocmd trim BufWritePre *.py call TrimEndLines()  " trim blank lines
augroup END

