lua << EOF
require('nvim-autopairs').setup()

require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true
})
EOF
