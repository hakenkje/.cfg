local ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  print("nvim-treesitter not installed")
  return
end

treesitter_configs.setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    'bash',
    'cpp',
    'css',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'python',
    'rust',
    'svelte',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
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
