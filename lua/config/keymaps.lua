-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
keymap.set("i", "jj", "<Esc>")

-- setting the increment and decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

local function deleteCurrentWord()
  -- 获取当前光标位置
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  -- 确定光标前的字符是否为空格或行首，以确定是否在单词的开头
  local line = vim.api.nvim_get_current_line()
  local char_before_cursor = col > 0 and line:sub(col, col) or " "

  -- 使用 vim.fn.searchpos 来找到当前单词的开始和结束
  local _, col_start = unpack(vim.fn.searchpos("\\<", "bcnW"))
  local _, col_end = unpack(vim.fn.searchpos("\\>", "cnW"))

  -- 如果光标正好在单词开始或前一个字符是空格（即光标在单词的开头），直接删除单词
  if col + 1 == col_start or char_before_cursor:match("%s") then
    vim.cmd("normal! daw")
  else
    -- 否则，移动到单词的开始并删除单词
    vim.api.nvim_win_set_cursor(0, { row, col_start - 1 })
    vim.cmd("normal! daw")
  end
end

keymap.set("n", "dw", "", { noremap = true, callback = deleteCurrentWord })

-- jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

--- new table
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

--- split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
---move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
---resi window
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
---Diagnostic
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- setting the copy and yank
vim.api.nvim_set_keymap("", "<C-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-v>", "c<C-R>+<Esc>", { noremap = true, silent = true })
