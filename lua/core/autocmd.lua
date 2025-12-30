--------------------------------------------------------------------------------------------------------------------------
-- 自动命令
--vim.api.nvim_create_autocmd("BufReadPost", {
--  pattern = "*",
--  callback = function()
--    if vim.fn.line('"') > 1 and vim.fn.line('"') <= vim.fn.line("$") then
--      vim.cmd('normal! g`"')
--    end
--  end,
--})


--------------------------------------------------------------------------------------------------------------------------
-- 格式化

-- vim.api.nvim_create_augroup("FormatMapping", { clear = true })

-- 定义映射函数
local function set_format_keymap(ft, cmd)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.keymap.set("n", "<Leader>f", cmd .. "<CR>:w<CR>", { buffer = true, silent = true, noremap = true })
      vim.keymap.set("v", "<Leader>f", cmd .. "<CR>:w<CR>", { buffer = true, silent = true, noremap = true })
    end,
    group = "FormatMapping"
  })
end

-- C 和 C++ 使用 ClangFormat
-- set_format_keymap({ "c", "cpp" }, ":ClangFormat")

-- Rust 使用 RustFmt
-- set_format_keymap("rust", ":RustFmt")

-- Python 和 Shell 使用 Autoformat
-- set_format_keymap({ "python", "sh" }, ":Autoformat")

--------------------------------------------------------------------------------------------------------------------------
-- 打开文件时，去到上次打开的位置
vim.api.nvim_create_augroup("SaveCursorPosition", { clear = true })

-- 自动命令：保存文件关闭时的位置
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "SaveCursorPosition",
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.getpos("'\"")
    -- 如果上次的位置有效
    if last_pos[2] > 0 and last_pos[2] <= vim.fn.line("$") then
      vim.api.nvim_command("normal! g'\"") -- 跳转到上次光标位置
    end
  end,
})
