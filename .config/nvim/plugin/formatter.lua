local ok, formatter = pcall(require, 'formatter')
if not ok then
  print("formatter not installed")
  return
end

local prettier = function()
  return {
    exe = "prettierd",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

formatter.setup({
  logging = false,
  filetype = {
    javascript = { prettier },
    javascriptreact = { prettier },
    typescript = { prettier },
    json = { prettier },
    typescriptreact = { prettier },
    svelte = { prettier },
    -- lua = {
    --   -- luafmt
    --   function()
    --     return {
    --       exe = "luafmt",
    --       args = {"--indent-count", 2, "--stdin"},
    --       stdin = true
    --     }
    --   end
    -- },
    python = {
      -- black
      function()
        return {
          exe = "black",
          args = {"-q", "-"},
          stdin = true
        }
      end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    java = {
      -- google-java-format
      function()
        return {
          exe = "google-java-format",
          args = {"--aosp", "-"},
          stdin = true
        }
      end
    }
  }
})

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  " autocmd BufWritePre *.java lua vim.lsp.buf.formatting()
  autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.json,*.py,*.rs,*.svelte,*.java FormatWrite
augroup END
]])
