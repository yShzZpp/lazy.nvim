-- 基础设置
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.cmdheight = 1
vim.opt.redrawtime = 10000
vim.opt.termguicolors = true
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,ucs-bom,gb18030,gbk,gb2312,cp936"
-- vim.opt.termencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.autowrite = true
vim.opt.updatetime = 1500
vim.o.hidden = true

-- 启用语法高亮（syntax折叠依赖语法高亮，必须开启）
vim.cmd('syntax on')

-- 折叠核心配置
vim.opt.foldenable = true        -- 启用折叠（默认可能关闭，必开）
-- vim.opt.foldmethod = "syntax"    -- 等价于 :set foldmethod=syntax
vim.opt.foldmethod = "indent"    -- 等价于 :set foldmethod=indent
vim.opt.foldlevel = 0            -- 折叠层级：0=显示所有可折叠块，99=默认全展开
vim.opt.foldlevelstart = 10      -- 打开文件时默认展开所有折叠（避免一打开就全折叠）
vim.opt.foldcolumn = "1"         -- 左侧显示折叠列（可选，0=不显示，1=显示折叠标记）

-- =============================================================================
-- Gotham & Coc.nvim 视觉增强配置模块
-- 目标：解决行参不可见及浮动窗口背景混淆问题
-- =============================================================================

-- 定义一个函数来应用我们的自定义高亮
-- 这样做的好处是逻辑封装清晰，且可以在不同地方复用
local function apply_gotham_coc_customizations()
    -- 1. 解决 Inlay Hints (行参) 颜色过深的问题
    -- 原理：原主题使用了 Base3 (#0a3749)，在黑背景下几乎不可见。
    -- 修改：使用 Gotham 调色板中的 "Magenta" (#888ca6)。
    -- 效果：颜色偏紫灰，亮度显著提高，与代码的蓝绿色系形成区分，符合"更淡且不一样"的需求。
    -- gui=italic (斜体) 有助于进一步区分这是"提示"而非"代码"。
    vim.api.nvim_set_hl(0, "CocInlayHintParameter", {
        -- fg = "#888ca6", -- Magenta
        fg = "#F2AAD6", -- 粉色
        bg = "NONE",    -- 保持背景透明，融入代码行
        italic = true   -- 推荐开启斜体，增加语义区分
    })

    -- 同步调整类型提示 (Type Hints)，使用稍暗的 Violet (#4e5166) 以建立次级层次
    vim.api.nvim_set_hl(0, "CocInlayHintType", {
        fg = "#5e81ac", -- 或者使用稍微亮一点的灰蓝色，确保可读性
        bg = "NONE",
        italic = true
    })

    -- 2. 解决浮动窗口 (Floating Window) 背景与主背景混淆的问题
    -- 原理：原主题浮动背景可能为 #0c1014，与主画布完全融合，导致没有层级感。
    -- 修改：将背景提升至 Base1 (#11151c) 或 Base2 (#091f2e)。
    -- 这里选用 Base1 (#11151c)，它比纯黑稍亮，呈现深海军蓝，营造出"卡片悬浮"的效果。
    vim.api.nvim_set_hl(0, "CocFloating", {
        fg = "#99d1ce", -- Base6: 保持文字高亮清晰
        bg = "#11151c"  -- Base1: 提升背景亮度，与主背景分离
        -- fg = "#ffffff", -- Base6: 保持文字高亮清晰
        -- bg = "#000000"  -- Base1: 提升背景亮度，与主背景分离
    })

    -- 3. 增强浮动窗口的边框可见性 无用
    -- 仅改变背景有时不够，增加一个深青色的边框能彻底隔离视觉区域。
    vim.api.nvim_set_hl(0, "CocFloatBorder", {
        fg = "#245361", -- Base4: 深青色边框
        bg = "#11151c"  -- 背景色与浮动窗口内部保持一致，实现无缝融合
        -- fg = "#ffffff", -- Base4: 深青色边框
        -- bg = "#ffffff"  -- 背景色与浮动窗口内部保持一致，实现无缝融合
    })

    -- [可选] 调整补全菜单的选中项颜色
    -- 确保在快速选择时，高亮条足够醒目（使用 Gotham 黄色背景，黑色文字）
    vim.api.nvim_set_hl(0, "CocMenuSel", {
        fg = "#0c1014", -- Base0
        bg = "#edb443", -- Yellow
        bold = true
    })
    
    -- [可选] 调整错误提示的浮动窗口颜色，使其更具警示性
    vim.api.nvim_set_hl(0, "CocErrorFloat", {
        fg = "#c23127", -- Red
        bg = "#11151c"  -- 保持背景统一
    })
end

-- 创建一个自动命令组，防止重复定义
local group = vim.api.nvim_create_augroup("CustomGothamOverrides", { clear = true })

-- 核心逻辑：监听 'ColorScheme' 事件
-- 每当 Neovim 加载颜色主题（包括启动时和运行时切换），都会触发此回调
vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    pattern = "*", -- 匹配所有主题，或者改为 "gotham" 仅针对 gotham 生效
    callback = function()
        -- 检查当前加载的主题是否为 gotham，确保不影响其他主题（如果未来切换的话）
        -- vim-gotham 有时会将 colors_name 设置为 gotham 或 gotham256
        local scheme = vim.g.colors_name or ""
        if string.find(scheme, "gotham") then
            apply_gotham_coc_customizations()
        end
    end,
})

-- 兜底逻辑：如果此代码在 colorscheme 加载之后运行（例如通过 lazy.nvim 的 config 回调），
-- 手动触发一次配置，确保第一次启动时生效。
if vim.g.colors_name and string.find(vim.g.colors_name, "gotham") then
    apply_gotham_coc_customizations()
end
