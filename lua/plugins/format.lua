return{
  --------------------格式化----------------------
  {
    "vim-autoformat/vim-autoformat",
    enabled = false,
    config = function()
    end,
  },
  {
    "rhysd/vim-clang-format",
    enabled = false,
    config = function()
      vim.g.clang_format_code_style = "file"
    end,
  },
  {
   "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        h = { "clang-format" },
        hpp = { "clang-format" },
        rust = { "rustfmt" },
        python = { "isort", "black" },
        sh = { "shfmt" },
      },
      -- 这里的 formatters 定义需要放在 opts 内部
      formatters = {
        ["clang-format"] = {
          prepend_args = { "--style=file:" .. vim.fn.expand("~/.clang-format") },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
    config = function(_, opts)
      -- 关键：必须手动调用 setup 并传入 opts
      require("conform").setup(opts)
  
      vim.keymap.set({ "n", "v" }, "<Leader>f", function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
        vim.cmd("silent! write")
        print("Formatted and Saved!")
      end, { desc = "Format buffer and save" })
    end
  },
}
