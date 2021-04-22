let g:black_string_normalization = 0
let g:black_skip_string_normalization = 1
autocmd BufWritePre *.py execute ':Black'
