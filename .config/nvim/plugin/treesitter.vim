lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = true,
        disable = {"python"}
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
EOF
