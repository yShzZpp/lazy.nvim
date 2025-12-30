return{
  --------------------git ui操作----------------------
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "nvim-mini/mini.pick",           -- optional
      "folke/snacks.nvim",             -- optional
    },
    cmd = "Neogit",
    keys = {
      -- { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    },
    highlight = {
      italic = true,
      bold = true,
    },
    -- 如果你开启了精细对比，尝试暂时关闭它看看是否清晰点
    disable_insert_on_commit = true,
  },
  --------------------?????----------------------
  {
    'tpope/vim-fugitive',
    cmd = { 'G', 'Git', 'Gdiffsplit', 'Gblame' },  -- 延迟加载命令
  },
  ---------------------------------代码中的git操作--------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '┃' }, -- 修改为你喜欢的符号
          change       = { text = '┃' },
          delete       = { text = '┃' },
          topdelete    = { text = '-' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        -- 实时预览修改内容 (非常实用)
        preview_config = {
          border = 'rounded',
        },
        -- 开启行内实时对比 (可选)
        signcolumn = true,  -- 开启左侧符号列
        numhl      = true,  -- 开启行号高亮（修改行的行号会变色）
        linehl     = false,  -- 开启整行背景高亮（这个最明显！）
      })

      -- 设置快捷键 (方便跳转和操作)
      local gs = package.loaded.gitsigns
      vim.keymap.set('n', ']c', gs.next_hunk, { desc = "Next Hunk" })
      vim.keymap.set('n', '[c', gs.prev_hunk, { desc = "Prev Hunk" })
      vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = "Preview Hunk" })
      vim.keymap.set('n', '<leader>gb', gs.blame_line, { desc = "Git Blame" })
      -- 1. 撤回/重置当前块 (Undo Hunk)
      vim.keymap.set('n', '<leader>ghr', gs.reset_hunk, { desc = "Reset Hunk" })

      -- 2. 撤回整个文件的所有修改
      vim.keymap.set('n', '<leader>ghR', gs.reset_buffer, { desc = "Reset Buffer" })
      
      -- 3. 开启行内词级对比
      vim.keymap.set('n', '<leader>gtw', gs.toggle_word_diff, { desc = "Toggle Word Diff" })
      
      -- 4. 甚至可以“撤回”暂存区 (Undo Stage)
      -- 如果你刚刚 add 了这块代码，现在想把这块从 Stage 里拿出来
      vim.keymap.set('n', '<leader>ghu', gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
    end
  },
}
