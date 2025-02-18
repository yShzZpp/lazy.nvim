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
map("n", "t", "`", opt)

-- 其他映射
map("n", "<leader>p", '"+p', opt)
map("n", "<leader>yaw", '"+yaw', opt)
map("n", "<leader>yy", '"+yy', opt)
map("v", "<leader>y", '"+y', opt)

-- 行号
map('n', '<silent> mn', ':set nonu nornu<CR>', opt)
map('n', '<silent> ms', ':set nu rnu<CR>', opt)

-- coc
-- 定义一个 Lua 函数，用来显示文档（文档悬浮窗口）
local function ShowDocumentation()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    -- 如果没有悬浮提供者，则模拟执行 K（通常用于显示内置帮助）
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("K", true, true, true), "in", false)
  end
end

-- 创建一个自动命令组，方便管理 Coc 相关的自动命令
local mygroup = vim.api.nvim_create_augroup("mygroup", { clear = true })

-- 当文件类型为 typescript 或 json 时，设置 formatexpr 为 CocAction('formatSelected')
vim.api.nvim_create_autocmd("FileType", {
  group = mygroup,
  pattern = { "typescript", "json" },
  callback = function()
    vim.opt_local.formatexpr = "CocAction('formatSelected')"
  end,
})

-- 当用户事件 CocJumpPlaceholder 触发时，调用 CocActionAsync 显示签名帮助
vim.api.nvim_create_autocmd("User", {
  group = mygroup,
  pattern = "CocJumpPlaceholder",
  callback = function()
    vim.fn.CocActionAsync("showSignatureHelp")
  end,
})

map("n", "<C-w>", ShowDocumentation, opt)
map("n", "<leader>rn", "<Plug>(coc-rename)", opt)

