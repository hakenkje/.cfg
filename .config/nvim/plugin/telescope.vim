lua << EOF
local telescope = require'telescope'
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
  extensions = {
  },
}
EOF

nnoremap <leader>f <cmd>Telescope find_files<cr>
" nnoremap <leader>F <cmd>Telescope frecency<cr>
nnoremap <leader>F <cmd>Telescope oldfiles<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>R <cmd>Telescope registers<cr>

nnoremap <leader>d <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>D <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>t <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>a <cmd>Telescope lsp_code_actions<cr>
nnoremap <leader>lr <cmd>Telescope lsp_references<cr>
