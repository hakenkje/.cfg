local ok, luatab = pcall(require, 'luatab')
if not ok then
  print("luatab not installed")
  return
end

luatab.setup{}
