return {
  --------------------注释----------------------
  {
    'numToStr/Comment.nvim',
    config = function()
        local comment = require('Comment')
        
        comment.setup({
            -- 默认配置
            padding = true,
            sticky = true,
        })

        -- Normal 模式：支持 7<leader>cc
        vim.keymap.set('n', '<leader>cc', function()
            return vim.v.count == 0
                and '<Plug>(comment_toggle_linewise_current)'
                or '<Plug>(comment_toggle_linewise_count)'
        end, { expr = true, desc = "Toggle comment" })

        -- Visual 模式：选中后按 <leader>cc
        vim.keymap.set('x', '<leader>cc', '<Plug>(comment_toggle_linewise_visual)')
    end
  },
  --------------------光标移动----------------------
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
  --------------------????----------------------
  {
    "mg979/vim-visual-multi",
    config = function()
      -- 配置
    end,
  },
  --------------------????----------------------
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
  --------------------自动输入需要匹配的符号----------------------
  {
    "jiangmiao/auto-pairs",
    config = function()
      -- 配置
    end,
  },
  --------------------ctrl + a/x 加减----------------------
  {
    "tpope/vim-speeddating",
    config = function()
      -- 配置
    end,
  },
}
