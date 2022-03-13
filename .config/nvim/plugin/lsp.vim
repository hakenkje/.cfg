lua <<EOF
local lsp_installer = require("nvim-lsp-installer")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Include the servers you want to have installed by default below
local servers = {
  "jdtls",
  "rust_analyzer",
  "pyright",
  "clangd",
  "sumneko_lua",
  "vimls",
  "jsonls",
  "yamlls",
  "tsserver",
  "cssmodules_ls",
  "cssls",
  "svelte",
}

-- Install default lsp servers
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing lsp server " .. name)
    server:install()
  end
end


lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
  }

  if server.name == "rust_analyzer" then
    require("rust-tools").setup {
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
    }
    server:attach_buffers()
    require("rust-tools").start_standalone_if_required()

  elseif server.name == "jdtls" then

    function jdtls_setup()
      opts.cmd = server:get_default_options().cmd
      require("jdtls").start_or_attach(opts)
    end

    if vim.bo.filetype == 'java' then
      jdtls_setup()
    end

    vim.cmd([[
      augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua jdtls_setup()
      augroup end
    ]])

  else
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end
end)

EOF

imap <silent> <c-space> <Plug>(completion_trigger)

nnoremap <silent> <leader>ll  <cmd>LspInstallInfo<cr>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <C-k>       <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> gD          <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gi          <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> <leader>r   <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> <leader>lf  <cmd>lua vim.lsp.buf.formatting()<cr>
" nnoremap <silent> <leader>wa   <cmd>lua vim.lsp.buf.add_workspace_folder()<cr>
" nnoremap <silent> <leader>wr   <cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>
" nnoremap <silent> <leader>wl   <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>
" nnoremap <silent> <leader>D    <cmd>lua vim.lsp.buf.type_definition()<cr>
" nnoremap <silent> <leader>e    <cmd>lua vim.diagnostic.show_line_diagnostics()<cr>
nnoremap <silent> [d          <cmd>lua vim.diagnostic.goto_prev()<cr>
nnoremap <silent> ]d          <cmd>lua vim.diagnostic.goto_next()<cr>
" nnoremap <silent> <leader>q    <cmd>lua vim.lsp.diagnostic.set_loclist()<cr>
