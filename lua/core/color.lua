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

-- 建议的配色：背景深色，前景（文字）高亮
local highlights = {
    -- 1. 新增行 (Added)
    NeogitDiffAdd = { fg = "#a6e3a1", bg = "#1e2e24" },          -- 淡绿字，深绿底
    NeogitDiffAddHighlight = { fg = "#ffffff", bg = "#2d4f3b" }, -- 白字，中绿底 (光标选中时)

    -- 2. 删除行 (Removed)
    NeogitDiffDelete = { fg = "#f38ba8", bg = "#311b20" },       -- 淡红字，深红底
    NeogitDiffDeleteHighlight = { fg = "#ffffff", bg = "#5a2d34" }, -- 白字，中红底

    -- 3. 行内精细修改 (Word-level diff/Refine)
    -- 这是最容易导致“绿字绿底”的罪魁祸首
    NeogitHunkHeader = { fg = "#89b4fa", bg = "#24273a" },       -- Diff 块标题
    NeogitHunkHeaderHighlight = { fg = "#ffffff", bg = "#303446" },
}

for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
end
