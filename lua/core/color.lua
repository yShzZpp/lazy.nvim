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

------------------------git-----------------------------
-- 修改为：亮黄文字，深黄/棕色背景
vim.api.nvim_set_hl(0, "GitsignsChange", { fg = "#EBCB8B", bg = "#3B3E2A", bold = true })

-- 如果你开启了行号高亮 (numhl)，也建议统一：
vim.api.nvim_set_hl(0, "GitsignsChangeNr", { fg = "#EBCB8B", bg = "#3B3E2A", bold = true })

-- 如果你开启了整行背景高亮 (linehl)，设置一个更淡的黄色背景：
vim.api.nvim_set_hl(0, "GitsignsChangeLn", { bg = "#2E2E1A" })

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

    -- 新增 (Add): 亮绿字 + 深绿背景
    GitsignsAdd          = { fg = "#7FFF00", bg = "#1A2F1A", bold = true },
    GitsignsAddNr        = { fg = "#7FFF00", bg = "#1A2F1A", bold = true },
    GitsignsAddLn        = { bg = "#142214" },

    -- 修改 (Change): 亮黄字 + 深棕背景
    GitsignsChange       = { fg = "#EEEE00", bg = "#332B1A", bold = true },
    GitsignsChangeNr     = { fg = "#EEEE00", bg = "#332B1A", bold = true },
    GitsignsChangeLn     = { bg = "#241F14" },

    -- 删除 (Delete): 亮红字 + 深红背景
    GitsignsDelete       = { fg = "#FF4500", bg = "#3F1A1A", bold = true },
    GitsignsDeleteNr     = { fg = "#FF4500", bg = "#3F1A1A", bold = true },
    GitsignsDeleteLn     = { bg = "#2F1414" },
    
    -- 边界情况处理
    GitsignsTopdelete    = { fg = "#FF4500", bg = "#3F1A1A", bold = true },
    GitsignsChangedelete = { fg = "#EEEE00", bg = "#332B1A", bold = true },
}

for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
end

------------------------git-----------------------------
