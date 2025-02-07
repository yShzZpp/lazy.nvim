-- 快捷键映射
local map = vim.keymap.set
local opt = {noremap = true, silent = true}

vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- 模式切换
map("i", "jk", "<ESC>", opt)
map("n", "<space>", ":", opt)
map("v", "<space>", ":", opt)

-- 移动
map("i", "<A-l>", "<Right>", opt)
map("i", "<A-h>", "<Left>", opt)
map("i", "<A-k>", "<Up>", opt)
map("i", "<A-j>", "<Down>", opt)
-- map("o", "<C-j>", "<C-n>", opt) -- 选择下一个
-- map("o", "<C-k>", "<C-p>", opt) -- 选择上一个

map('n', 'L', '$', opt)
map('v', 'L', '$', opt)
map('o', 'L', '$', opt) -- 操作等待模式
map('n', 'H', '^', opt)
map('v', 'H', '^', opt)
map('o', 'H', '^', opt)

-- 窗口切换
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-h>", "<C-w>h", opt)

-- 其他映射
map("n", "<leader>p", '"+p', opt)
map("n", "<leader>yaw", '"+yaw', opt)
map("n", "<leader>yy", '"+yy', opt)
map("v", "<leader>y", '"+y', opt)

