lua << EOF
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local npairs = require('nvim-autopairs')

npairs.setup()

npairs.add_rules {
  Rule("|","|","rust")
    :with_cr(cond.none()),
}

require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true
})
EOF
