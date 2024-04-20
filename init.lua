-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[colorscheme solarized-osaka]])
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#FFFFFF", bg = "#303030" })
local powershell_options = {
  shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_transparency = 0.87
  vim.g.neovide_theme = "dark"
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_refresh_rate = 60
  vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
  -- 在可视模式和普通模式下从系统剪贴板复制和粘贴
  vim.keymap.set("v", "<C-c>", '"+y', { silent = true }) -- 复制
  vim.keymap.set("n", "<C-v>", '"+p', { silent = true }) -- 普通模式粘贴
  vim.keymap.set("v", "<C-v>", '"+p', { silent = true }) -- 可视模式粘贴
  vim.keymap.set("v", "<C-v>", '"+p', { silent = true })
  -- 在命令行模式下粘贴
  vim.keymap.set("c", "<C-v>", "<C-R>+", { silent = true })
  -- 在插入模式下粘贴
  vim.keymap.set("i", "<C-v>", "<C-R>+", { silent = true })
  -- 如果使用终端模式
  vim.keymap.set("t", "<C-v>", "<C-R>+", { silent = true })
end

--if vim.g.neovide then
--vim.api.nvim_create_autocmd("VimEnter", {
--pattern = "*",
--callback = function()
--vim.cmd("silent !im-select.exe 1033")
--end,
--})
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if vim.g.neovide then
      vim.defer_fn(function()
        vim.fn.system("im-select.exe 1033")
      end, 0)
    end
  end,
})
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.fn.system("im-select.exe 1033")
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("silent !im-select.exe 2052")
  end,
})
--end
