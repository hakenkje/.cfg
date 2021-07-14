lua << EOF
local telescope = require'telescope'
local actions = require('telescope.actions')
telescope.setup{
  defaults = {
    layout_strategy = "horizontal",
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
}
-- telescope.load_extension('frecency')
EOF

nnoremap <leader>f <cmd>Telescope find_files<cr>
" nnoremap <leader>F <cmd>Telescope frecency<cr>
nnoremap <leader>F <cmd>Telescope oldfiles<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>R <cmd>Telescope registers<cr>

" nnoremap <Leader>pp :lua require'telescope.builtin'.planets{}

nnoremap <leader>d <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>D <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>t <cmd>Telescope lsp_workspace_symbols<cr>
