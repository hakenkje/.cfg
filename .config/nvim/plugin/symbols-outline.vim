lua << EOF
vim.g.symbols_outline = {
    highlight_hovered_item = false,
    show_guides = false,
    auto_preview = false,
    symbol_blacklist = {"Variable", "Property", "TypeParameter"},
}
EOF

nnoremap <silent> <leader>o <cmd>SymbolsOutline<CR>

