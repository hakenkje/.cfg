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

vim.cmd([[
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>F <cmd>Telescope oldfiles<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>R <cmd>Telescope registers<cr>

nnoremap <leader>d <cmd>Telescope diagnostics bufnr=0<cr>
nnoremap <leader>D <cmd>Telescope diagnostics severity_limit=Error<cr>
nnoremap <leader>t <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <leader>a <cmd>Telescope lsp_code_actions<cr>
nnoremap <leader>lr <cmd>Telescope lsp_references<cr>

nnoremap <leader>li <cmd>Telescope lsp_implementations<cr>
nnoremap <leader>lr <cmd>Telescope lsp_references<cr>
]])
