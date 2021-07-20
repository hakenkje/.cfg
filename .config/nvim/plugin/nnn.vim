let g:nnn#set_default_mappings = 0
nnoremap <leader>n :NnnPicker %:p:h<CR>
nnoremap <silent> <leader>N :NnnPicker<CR>
let g:nnn#layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Debug' } }

let g:nnn#action = {
    \ '<c-t>': 'tab split' }
