local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not ok then
  print("nvim-lsp-installer not installed")
  return
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "clangd",
  "cssls",
  "cssmodules_ls",
  "jdtls",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "svelte",
  "tsserver",
  "vimls",
  "yamlls",
}

-- Install default lsp servers
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing lsp server " .. name)
    server:install()
  end
end

local on_attach = function(_, bufnr)
  require("lsp_signature").on_attach({
    bind = true,
    hi_parameter = "IncSearch",
    hint_enable = true,
  }, bufnr)

  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gj', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, opts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  if server.name == "sumneko_lua" then
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    opts.settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false },
      },
    }
    server:setup(opts)

  elseif server.name == "rust_analyzer" then
    require("rust-tools").setup {
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
    }
    server:attach_buffers()
    require("rust-tools").start_standalone_if_required()

  elseif server.name == "jdtls" then

    opts.on_attach = function(_, bufnr)
      on_attach(nil, bufnr)

      require'jdtls.setup'.add_commands()
      require'jdtls'.setup_dap({ hotcodereplace = 'auto' })

      local opt = { buffer = bufnr }
      vim.keymap.set('n', '<leader>dt', require'jdtls'.test_class, opt)
      vim.keymap.set('n', '<leader>dn', require'jdtls'.test_nearest_method, opt)
    end

    -- Install plugins as described in https://github.com/mfussenegger/nvim-jdtls#debugger-via-nvim-dap
    local jar_patterns = {
        '~/workspace/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
        '~/workspace/vscode-java-test/server/*.jar',
    }

    local bundles = {}
    for _, jar_pattern in ipairs(jar_patterns) do
      for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), '\n')) do
        if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
          table.insert(bundles, bundle)
        end
      end
    end

    opts.init_options = {
      bundles = bundles,
    }

    opts.on_init = function(client)
      if client.config.settings then
        client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
      end
    end

    opts.settings = {
      java = {
        signatureHelp = { enabled = true },
        contentProvider = { preferred = 'fernflower' },
        import = {
          exclusions = {
            "?*/**",
          }
        },
        project = {
          resourceFilters = {
            "node_modules",
            ".git",
            "bazel-abelee",
            "bazel-bin",
            "bazel-out",
            "bazel-rust-testlogs",
            "bazel-testlogs",
          }
        }
      }
    }

    function JdtlsSetup ()
      opts.cmd = server:get_default_options().cmd
      require("jdtls").start_or_attach(opts)
    end

    if vim.bo.filetype == 'java' then
      JdtlsSetup()
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = JdtlsSetup,
    })

  else
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end
end)

vim.keymap.set('n', '<leader>ll', "<cmd>LspInstallInfo<cr>", { silent = true })
