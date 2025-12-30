return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      local opts = {silent = true, nowait = true, expr = true}
      vim.g.coc_global_extensions = { "coc-clangd", "coc-json" }
      vim.keymap.set("i", "<C-j>", "coc#pum#visible() ? coc#pum#next(1) : '<C-j>'", { expr = true, silent = true })
      vim.keymap.set("i", "<C-k>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-k>'", { expr = true, silent = true })
      -- vim.keymap.set("i", "<CR>", "<C-r>=coc#_select_confirm()<CR>", { silent = true  })
      vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#_select_confirm() : "\<CR>"]], { expr = true, silent = true })
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
      vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
      vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
      -- vim.keymap.set("n", "gp", "<Plug>(coc-diagnostics-next)", { silent = true })
      vim.keymap.set("n", "gP", function() vim.fn.CocAction("diagnosticPrevious") end, { silent = true })
      vim.keymap.set("n", "gp", function() vim.fn.CocAction("diagnosticNext") end, { silent = true })
      vim.keymap.set("n", "qf", "<Plug>(coc-fix-current)", { silent = true })
      vim.keymap.set("n", "<C-s>", "<Plug>(coc-cursors-position)", { silent = true })

      -- Ctrl + f : 向下滚动浮动窗口 (如果存在)，否则执行原生的翻页
      vim.keymap.set("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
      vim.keymap.set("i", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<Right>"', opts)

      -- Ctrl + b : 向上滚动浮动窗口 (如果存在)，否则执行原生的翻页
      vim.keymap.set("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
      vim.keymap.set("i", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<Left>"', opts)
    end,
  },
}
