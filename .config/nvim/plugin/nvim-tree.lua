local ok, tree = pcall(require, 'nvim-tree')
if not ok then
  print("nvim-tree not installed")
  return
end

tree.setup {
  disable_netrw       = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = {},
    exclude = {}
  },
  view = {
    width = 40,
  },
}

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true})
vim.g.nvim_tree_highlight_opened_files=1
vim.g.nvim_tree_group_empty=1
