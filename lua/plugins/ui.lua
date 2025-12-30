return {
  ---------------------------------主题--------------------------------------
  { "whatyouhide/vim-gotham", lazy = true },
  --------------------------------文件树-----------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- 确保这里写的是全名
      --"nvim-tree/web-devicons", -- 必须安装图标插件，否则会报错
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        -- 1. 窗口样式与基本键位
        window = {
          position = "left",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            -- 覆盖/添加你要求的快捷键
            ["R"] = "refresh",             -- R 刷新
            ["C"] = "set_root",            -- C 设置当前目录为根目录
            ["u"] = "navigate_up",         -- u 向上一层目录
            
            -- 常用基础操作保持默认
            ["<cr>"] = "open",             -- 回车打开
            ["s"] = "open_split",          -- 水平分屏
            ["v"] = "open_vsplit",         -- 垂直分屏
            ["a"] = "add",                 -- 新增
            ["d"] = "delete",              -- 删除
            ["r"] = "rename",              -- 重命名
            ["q"] = "close_window",        -- 退出
            ["?"] = "show_help",           -- 查看完整帮助
          },
        },
        
        -- 2. 文件系统配置
        filesystem = {
          filtered_items = {
            visible = true,              -- 是否显示隐藏文件
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,              -- 自动定位当前正在编辑的文件
          },
          use_libuv_file_watcher = true, -- 使用系统级监控提升性能
        },
      })

      -- 3. 全局快捷键：Ctrl + e 打开/关闭文件树
      -- 无论光标在哪里，按 Ctrl + e 都会切换侧边栏状态
      vim.keymap.set('n', '<C-e>', ':Neotree toggle left<CR>', { 
        noremap = true, 
        silent = true, 
        desc = "Toggle Neo-tree" 
      })

      -- 如果在终端模式下也想一键开关
      vim.keymap.set('t', '<C-e>', [[<C-\><C-n>:Neotree toggle left<CR>]], { 
        noremap = true, 
        silent = true 
      })
    end
  },
  --------------------------------顶部-----------------------------------
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal",
          close_command = "bdelete! %d",
          indicator = { 
          icon = '',
          style = 'icon'
        },
        buffer_close_icon = '',
        show_buffer_icons = true,
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = "coc",
        max_name_length = 40
        },
      })
      vim.keymap.set("n", "<A-1>" ,":BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-2>" ,":BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-3>" ,":BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-4>" ,":BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-5>" ,":BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-6>" ,":BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-7>" ,":BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-8>" ,":BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-9>" ,":BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-h>" ,":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-l>" ,":BufferLineCycleNext<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-j>" ,":BufferLineMovePrev<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<A-k>" ,":BufferLineMoveNext<CR>", {noremap = true, silent = true})
      vim.keymap.set("n", "<leader>p" ,":BufferLinePick<CR>", {noremap = true, silent = true})
      -- vim.keymap.set("n", "<leader>q" ,":BufferLinePickClose<CR>", {noremap = true, silent = true})
    end,
  },
  --------------------关闭单一buffer----------------------
  {
      "famiu/bufdelete.nvim",
      vim.keymap.set("n", "<leader>q", ":Bdelete<CR>", {noremap = true, silent = true})
  },

  -- 视觉辅助
  --------------------空格的竖线----------------------
  { "Yggdroot/indentLine", config = function() vim.g.indent_guides_guide_size = 1 vim.g.indent_guides_start_level = 2 end, },
  --------------------多层括号彩虹颜色----------------------
  { "luochen1990/rainbow", config = function() vim.g.rainbow_active = 1 end, },
  { "rcarriga/nvim-notify", config = function() vim.notify = require("notify") end },
}
