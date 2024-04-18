-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here



vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  command = "silent !im-select.exe 2052",
})

-- 离开插入模式
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "silent !im-select.exe 1033",
})


