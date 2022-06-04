
local ok, dap = pcall(require, 'dap')
if not ok then
  print("dap not installed")
  return
end

local oku, dapui = pcall(require, 'dapui')
if not oku then
  print("dap-ui not installed")
  return
end

local okv, dapvtxt = pcall(require, 'nvim-dap-virtual-text')
if not okv then
  print("nvim-dap-virtual-text not installed")
  return
end

dapui.setup()
dapvtxt.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open(nil)
end

vim.keymap.set("n", "<F3>", dap.terminate)
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F6>", dap.step_over)
vim.keymap.set("n", "<F7>", dap.step_into)
vim.keymap.set("n", "<F8>", dap.step_out)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set("n", "<leader>dp", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>df', dapui.float_element)

vim.keymap.set("n", "<leader>dd", function()
  dap.clear_breakpoints()
  dap.terminate()
  dapui.close(nil)
end)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dap-repl",
  callback = function() require('dap.ext.autocompl').attach() end,
})
