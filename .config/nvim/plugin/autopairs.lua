local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local npairs = require('nvim-autopairs')

npairs.setup()

npairs.add_rules {
  Rule("|","|","rust")
    :with_cr(cond.none()),
}
