local ok, outline = pcall(require, 'symbols-outline')
if not ok then
  print("symbols-outline not installed")
  return
end

outline.setup({
  highlight_hovered_item = true,
  show_guides = false,
  auto_preview = false,
  symbol_blacklist = {"Variable", "Property", "TypeParameter"},
  relative_width = false,
  width = 40,
})

vim.keymap.set('n', '<leader>o', "<cmd>SymbolsOutline<cr>", { silent = true })
