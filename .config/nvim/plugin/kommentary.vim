lua << EOF
local kommentary = require('kommentary.config')

kommentary.configure_language("scss", {
    -- single_line_comment_string = "//",
    prefer_multi_line_comments = true,
    multi_line_comment_strings = {"/*", "*/"},
})

kommentary.configure_language('typescriptreact', {
  single_line_comment_string = 'auto',
  multi_line_comment_strings = 'auto',
  hook_function = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end,
})
EOF
