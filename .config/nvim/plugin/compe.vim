lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  min_length = 1;
  throttle_time = 80;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = false;
    vsnip = false;
    ultisnips = false;
    luasnip = true;
  };
}
EOF

set completeopt=menuone,noinsert,noselect

inoremap <silent><expr> <C-p>     compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
