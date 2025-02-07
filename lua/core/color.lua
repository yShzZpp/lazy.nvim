-- 对话框的颜色
vim.api.nvim_set_hl(0, "AvanteTitle", { fg = "#1e222a", bg = "#98c379" , bold = false, italic = false })
vim.api.nvim_set_hl(0, "AvanteReversedTitle", { fg = "#98c379"})
vim.api.nvim_set_hl(0, "AvanteSubtitle", { fg = "#1e222a", bg = "#56b6c2" })
vim.api.nvim_set_hl(0, "AvanteReversedSubtitle", { fg = "#56b6c2" })
vim.api.nvim_set_hl(0, "AvanteThirdTitle", { fg = "#ABB2BF", bg = "#353B45" })
vim.api.nvim_set_hl(0, "AvanteReversedThirdTitle", { fg = "#353B45" })
vim.api.nvim_set_hl(0, "AvanteSuggestion", { link = "Comment" })
vim.api.nvim_set_hl(0, "AvanteAnnotation", { link = "Comment" })
vim.api.nvim_set_hl(0, "AvantePopupHint", { link = "NormalFloat" })
vim.api.nvim_set_hl(0, "AvanteInlineHint", { link = "Keyword" })
vim.api.nvim_set_hl(0, "AvanteToBeDeleted", { bg = "#ffcccc", strikethrough = true  })
-- 代码冲突的颜色
vim.api.nvim_set_hl(0, "AvanteConflictCurrent", { bg = "#a86c4c", bold = true })
vim.api.nvim_set_hl(0, "AvanteConflictCurrentLabel", { link = "AvanteConflictCurrent" })

vim.api.nvim_set_hl(0, "AvanteConflictIncoming", { bg = "#567d3b", bold = true })
vim.api.nvim_set_hl(0, "AvanteConflictIncomingLabel", { link = "AvanteConflictIncoming" })

vim.api.nvim_set_hl(0, "AvanteConflictAncestor", { bg = "#7d3b7d", bold = true })
vim.api.nvim_set_hl(0, "AvanteConflictAncestorLabel", { link = "AvanteConflictAncestor" })
