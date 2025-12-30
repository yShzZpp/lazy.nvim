return{
  {
      "github/copilot.vim",
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    enabled = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "deepseek",
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          -- model = "deepseek-reasoner",
          model = "deepseek-code",
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
  {
    'gutsavgupta/nvim-gemini-companion',
    dependencies = { 'nvim-lua/plenary.nvim' },
    enabled = false,
    event = 'VeryLazy',
    config = function()
      require('gemini').setup()
    end,
    keys = {
      { '<leader>a', nil, desc = 'Gemini Code' },
      { '<leader>ag', '<cmd>GeminiToggle<cr>', desc = 'Toggle Gemini sidebar' },
      { '<leader>ac', '<cmd>GeminiSwitchToCli<cr>', desc = 'Spawn or switch to AI session' },
      { '<leader>ad', '<cmd>GeminiSendLineDiagnostic<cr>', mode = 'n', desc = 'Send to Gemini' },
      { '<leader>aD', '<cmd>GeminiSendFileDiagnostic<cr>', mode = 'n', desc = 'Send to Gemini' },
      { '<leader>aa', '<cmd>GeminiAccept<cr>', mode = 'n', desc = 'Accept Gemini Diff' },
      { '<leader>ad', '<cmd>GeminiDeny<cr>', mode = 'n', desc = 'Deny Gemini Diff' },
      { '<leader>as', '<cmd>GeminiSend<cr>', mode = { 'v' }, desc = 'Send selection to Gemini' },
    },
  },
}
