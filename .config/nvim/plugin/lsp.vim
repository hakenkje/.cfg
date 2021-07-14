lua << EOF
local lspconfig = require'lspconfig'
local completion = require("completion")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.pyright.setup{on_attach=completion.on_attach}
lspconfig.tsserver.setup{on_attach=completion.on_attach}
lspconfig.jsonls.setup{on_attach=completion.on_attach}
lspconfig.cssls.setup{
  capabilities = capabilities,
  on_attach=completion.on_attach
}
lspconfig.svelte.setup{}
EOF

imap <silent> <c-p> <Plug>(completion_trigger)

nnoremap <silent> gD          <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi          <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <C-k>       <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <space>wa   <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
" nnoremap <silent> <space>wr   <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
" nnoremap <silent> <space>wl   <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent> <space>D    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <space>rn   <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <space>e    <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> [d          <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d          <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <silent> <space>q    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
