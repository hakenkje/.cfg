require'nvim-treesitter.configs'.setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {'python', 'rust', 'lua', 'vim', 'json', 'yaml', 'java', 'cpp', 'html', 'javascript', 'tsx', 'typescript', 'css', 'svelte'},
  highlight = {
    enable = true
  },
  indent = {
    enable = false,
    disable = {"python", "java", "lua"}
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
}
