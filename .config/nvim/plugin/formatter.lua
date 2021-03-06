local ok, formatter = pcall(require, 'formatter')
if not ok then
  print("formatter not installed")
  return
end

local util = require "formatter.util"

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
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
    python = {
      -- black
      function()
        return {
          exe = "black",
          args = {"-q", "-l", "100", "-"},
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
          args = {"--aosp", "--skip-reflowing-long-strings", "-"},
          stdin = true
        }
      end
    },
    bzl = {
      -- buildifier
      function()
        return {
          exe = "buildifier",
          args = {"-lint", "fix", "-path", util.escape_path(util.get_current_buffer_file_path())},
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
  autocmd BufWritePost * FormatWrite
augroup END
]])
