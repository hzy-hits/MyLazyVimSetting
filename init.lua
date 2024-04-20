-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- local powershell_options = {
--   shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
--   shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--   shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--   shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--   shellquote = "",
--   shellxquote = "",
-- }
--
-- for option, value in pairs(powershell_options) do
--   vim.opt[option] = value
-- end

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if vim.g.neovide then
      vim.defer_fn(function()
        vim.fn.system("im-select com.apple.keylayout.US")
      end, 0) -- 延迟1000毫秒执行
    end
  end,
})
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.fn.system("im-select com.apple.keylayout.US")
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("silent !im-select com.apple.inputmethod.SCIM.ITABC")
  end,
})
--end
--test for git
