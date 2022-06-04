local ok, telescope = pcall(require, 'telescope')
if not ok then
  print("telescope not installed")
  return
end

local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    path_display = {"smart"},
    layout_config = {
      prompt_position = "top"
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-q>"] = actions.delete_buffer,
        },
        n = {
          ["<c-q>"] = actions.delete_buffer,
        },
      },
    },
  },
  extensions = {},
}

local opts = { silent = true }
vim.keymap.set('n', '<leader>f', "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set('n', '<leader>F', "<cmd>Telescope oldfiles<cr>", opts)
vim.keymap.set('n', '<leader>g', "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set('n', '<leader>b', "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set('n', '<leader>R', "<cmd>Telescope registers<cr>", opts)
vim.keymap.set('n', '<leader>R', "<cmd>Telescope registers<cr>", opts)

vim.keymap.set('n', '<leader>ld', "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
vim.keymap.set('n', '<leader>lD', "<cmd>Telescope diagnostics severity_limit=Error<cr>", opts)
vim.keymap.set('n', '<leader>lt', "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
vim.keymap.set('n', '<leader>lr', "<cmd>Telescope lsp_references<cr>", opts)
vim.keymap.set('n', '<leader>li', "<cmd>Telescope lsp_implementations<cr>", opts)
vim.keymap.set('n', '<leader>lr', "<cmd>Telescope lsp_references<cr>", opts)
