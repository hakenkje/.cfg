local ok, npairs = pcall(require, 'nvim-autopairs')
if not ok then
  print("nvim-autopairs not installed")
  return
end

local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup()

npairs.add_rules {
  Rule("|","|","rust")
    :with_cr(cond.none()),
}
