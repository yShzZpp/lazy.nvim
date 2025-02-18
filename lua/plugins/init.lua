local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--require("lazy").setup({
return {
  -- 插件列表
  -- 终端 alt + = 打开
  {
    "skywind3000/vim-terminal-help",
    config = function()
      -- 配置
    end,
  },
  -- ctrl + a/x 加减
  {
    "tpope/vim-speeddating",
    config = function()
      -- 配置
    end,
  },
  -- nerdtree
  {
    "scrooloose/nerdtree",
    config = function()
      vim.g.NERDTreeWinSize = 35
      vim.g.NERDTreeShowBookmarks = 1
      vim.g.NERDTreeIgnore = { "%.pyc$" } -- 过滤.pyc文件
      -- vim g.NERDTreeDirArrowExpandable = '▶ '
      -- vim g.NERDTreeDirArrowCollapsible = '▼ '
      vim.g.NERDTreeShowLineNumbers = 0 -- 是否显示行号
      vim.g.NERDTreeHidden = 0
      vim.g.NERDTreeShowHidden = 1
      vim.keymap.set("n", "<C-e>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>v", ":NERDTreeFind<CR>", { noremap = true })
    end,
  },
  -- nerdtree高亮
  {
    "tiagofumo/vim-nerdtree-syntax-highlight",
    dependencies = { "scrooloose/nerdtree" },
    config = function()
      vim.cmd([[
        let s:brown = "905532"
        let s:aqua =  "3AFFDB"
        let s:blue = "689FB6"
        let s:darkBlue = "44788E"
        let s:purple = "834F79"
        let s:lightPurple = "834F79"
        let s:red = "AE403F"
        let s:beige = "F5C06F"
        let s:yellow = "F09F17"
        let s:orange = "D4843E"
        let s:darkOrange = "F16529"
        let s:pink = "CB6F6F"
        let s:salmon = "EE6E73"
        let s:green = "8FAA54"
        let s:Turquoise = "40E0D0"
        let s:lightGreen = "31B53E"
        let s:white = "FFFFFF"
        let s:rspec_red = "FE405F"
        let s:git_orange = "F54D27"
        let s:gray = "808A87"
        let g:webdevicons_enable_nerdtree = 1
        let g:webdevicons_conceal_nerdtree_brackets = 1
        let g:webdevicons_enable_airline_tabline = 1
        let g:webdevicons_enable_airline_statusline = 1
        let g:NERDTreeFileExtensionHighlightFullName = 1
        let g:NERDTreeExactMatchHighlightFullName = 1
        let g:NERDTreePatternMatchHighlightFullName = 1
        let g:NERDTreeHighlightFolders = 1
        let g:NERDTreeHighlightFoldersFullName = 1
        let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
        let g:NERDTreeExtensionHighlightColor['o'] = s:gray
        let g:NERDTreeExtensionHighlightColor['h'] = s:blue
        let g:NERDTreeExtensionHighlightColor['c'] = s:green
        let g:NERDTreeExtensionHighlightColor['so'] = s:pink
        let g:NERDTreeExtensionHighlightColor['o'] = s:pink
        let g:NERDTreeExtensionHighlightColor['a'] = s:pink
        let g:NERDTreeExtensionHighlightColor['cpp'] = s:yellow
        let g:NERDTreeExtensionHighlightColor['md'] = s:blue
        let g:NERDTreeExtensionHighlightColor['c++'] = s:green
        let g:NERDTreeExtensionHighlightColor['launch'] = s:lightGreen
        let g:NERDTreeExtensionHighlightColor['lua'] = s:pink
      ]])
    end,
  },
  -- 主题
  { "whatyouhide/vim-gotham", lazy = true},
  -- bufferline图标
  { "nvim-tree/nvim-web-devicons", lazy = false},
  -- nerdtree图标
  { 
    "ryanoasis/vim-devicons",
    config = function()
      vim.g.NERDTreeGitStatusWithFlags = 1   -- 启用 Git 状态
      vim.g.NERDTreeShowIcons = 1            -- 启用图标支持
    end,
    lazy = false
  },

  {
    "mg979/vim-visual-multi",
    config = function()
      -- 配置
    end,
  },
  {
    "mhinz/vim-signify",
    config = function()
      -- 设置要检查的VCS
      vim.g.signify_vcs_list = { 'git' }
      
      -- 插入模式下指定 updatetime 时间后无操作将缓存区交换文件写入磁盘
      vim.g.signify_cursorhold_insert = 1
      
      -- 正常模式下指定 updatetime 时间后无操作将缓存区交换文件写入磁盘
      vim.g.signify_cursorhold_normal = 1
      
      -- 缓冲区被修改时更新符号
      vim.g.signify_update_on_bufenter = 0
      
      -- vim获取焦点时更新符号
      vim.g.signify_update_on_focusgained = 1
      
      -- hunk jumping
      vim.api.nvim_set_keymap('n', '<leader>gj', '<plug>(signify-next-hunk)', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>gk', '<plug>(signify-prev-hunk)', { noremap = true, silent = true })
    end,
  },
  {
    "tpope/vim-surround",
    config = function()
      -- 配置
    end,
  },
  {
    "gcmt/wildfire.vim",
    config = function()
      -- 配置
    end,
  },
  -- 自动输入需要匹配的符号
  {
    "jiangmiao/auto-pairs",
    config = function()
      -- 配置
    end,
  },
  -- nerdtree git
  {
    "preservim/nerdcommenter",
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDCompactSexyComs = 1
      vim.g.NERDDefaultAlign = "left"
      vim.g.NERDCommentEmptyLines = 1
      vim.g.NERDTrimTrailingWhitespace = 1
      vim.g.NERDToggleCheckAllLines = 1
      vim.cmd([[
        let g:NERDTreeGitStatusPorcelainVersion = 1
        let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

      ]])
    end,
  },
  -- 空格的竖线
  {
    "Yggdroot/indentLine",
    config = function()
      vim.g.indent_guides_guide_size = 1
      vim.g.indent_guides_start_level = 2
    end,
  },
  {
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = 1
    end,
  },
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
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.g.coc_global_extensions = { "coc-clangd", "coc-json" }
      vim.keymap.set("i", "<C-j>", "coc#pum#visible() ? coc#pum#next(1) : '<C-j>'", { expr = true, silent = true })
      vim.keymap.set("i", "<C-k>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-k>'", { expr = true, silent = true })
      -- vim.keymap.set("i", "<CR>", "<C-r>=coc#_select_confirm()<CR>", { silent = true  })
      vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#_select_confirm() : "\<CR>"]], { expr = true, silent = true })
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
      vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
      vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
      vim.keymap.set("n", "gp", "<Plug>(coc-diagnostics-next)", { silent = true })
      vim.keymap.set("n", "gP", "<Plug>(coc-diagnostics-prev)", { silent = true })
      vim.keymap.set("n", "qf", "<Plug>(coc-fix-current)", { silent = true })
      vim.keymap.set("n", "<C-s>", "<Plug>(coc-cursors-position)", { silent = true })
    end,
  },
  {
    "majutsushi/tagbar",
    config = function()
      vim.keymap.set("n", "tb", ":TagbarToggle<CR>", { noremap = true })
    end,
  },
  {
    "vim-scripts/winmanager",
    config = function()
      vim.g.winManagerWindowLayout = "NERDTree"
      vim.keymap.set("n", "<C-e>", ":WMToggle<CR>", { noremap = true })
    end,
    lazy = true
  },
  {
    "easymotion/vim-easymotion",
    config = function()
      vim.g.EasyMotion_leader_key = '<leader>'
      vim.api.nvim_set_keymap('n', '<leader>w', '<Plug>(easymotion-w)', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>e', '<Plug>(easymotion-e)', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>b', '<Plug>(easymotion-b)', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>j', '<Plug>(easymotion-j)', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>k', '<Plug>(easymotion-k)', { noremap = true, silent = true })
    end,
  },
  {
    "vim-autoformat/vim-autoformat",
    config = function()
    end,
  },
  {
    "rhysd/vim-clang-format",
    config = function()
      vim.g.clang_format_code_style = "file"
    end,
  },
  {
    "Xuyuanp/nerdtree-git-plugin",
    dependencies = { "scrooloose/nerdtree" },
  },
  {
    "sk1418/howmuch",
    config = function()
      vim.g.HowMuch_scale = 2
      vim.g.HowMuch_auto_engines = { "bc", "vim", "py" }
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },
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
      vim.keymap.set("n", "<leader>q" ,":BufferLinePickClose<CR>", {noremap = true, silent = true})
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "deepseek",
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-reasoner",
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
