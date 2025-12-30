return{
  --------------------------------终端-----------------------------------
  -- 终端 alt + = 打开
  {
    "skywind3000/vim-terminal-help",
    enabled = false,
    config = function()
      -- 配置
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<A-=>]], -- 快捷键：Ctrl + \ 弹出/隐藏
        hide_numbers = true, 
        shade_terminals = true,
        direction = 'float', -- 弹出方式：'float' (浮窗), 'horizontal', 'vertical'
        close_on_exit = true, -- 终端进程退出后自动关闭窗口
        shell = vim.o.shell,
      })
    end
  },
  --------------------------------fzf搜索-----------------------------------
  {
    "junegunn/fzf",
    build = ":call fzf#install()",
  },
  {
    "junegunn/fzf.vim",
    config = function()
      vim.keymap.set("n", "<F3>f", ":Files<CR>", { noremap = true })
      vim.keymap.set("n", "<F3>w", ":Ag<CR>", { noremap = true })
      vim.keymap.set("n", "<F3>b", ":Buffers<CR>", { noremap = true })
    end,
  },
  --------------------------------wakatime-----------------------------------
  {
    'wakatime/vim-wakatime',
    lazy = false 
  },
  --------------------------------数学计算-----------------------------------
  {
    "sk1418/howmuch",
    config = function()
      vim.g.HowMuch_scale = 2
      vim.g.HowMuch_auto_engines = { "bc", "vim", "py" }
    end,
  },
}
