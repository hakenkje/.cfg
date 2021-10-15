lua << EOF

local prettier = function()
  return {
    exe = "prettierd",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require('formatter').setup({
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
  }
})
EOF

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.json,*.lua,*.py,*.rs,*.svelte FormatWrite
augroup END
