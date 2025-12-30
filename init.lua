-- ~/.config/nvim/init.lua

-- 1. 加载基础设置 (选项、快捷键等)
require("core")

-- 2. 直接在这里安装并配置 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. 启动 lazy，并自动加载 lua/plugins 文件夹下的所有文件
require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

-- 4. 加载主题 (确保此时插件已加载)
vim.cmd("colorscheme gotham256")
require('core.color')
