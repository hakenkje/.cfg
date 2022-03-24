local ok, lualine = pcall(require, 'lualine')
if not ok then
  print("lualine not installed")
  return
end

lualine.setup {
  options = {
    section_separators = '',
    component_separators = '',
    theme = 'nightfox',
  }
}
