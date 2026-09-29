-- GrokNight / GrokDay highlight groups.
-- Dark chrome matches Ghostty "Grok Dark".
-- Light surfaces and chrome match GrokDay: gray ramp, user accent #444444.

local M = {}

local palettes = {
	dark = {
		none = "NONE",
		bg = "#141414",
		bg_elevated = "#242424",
		bg_float = "#1c1c1c",
		bg_highlight = "#2a2a2a",
		bg_visual = "#2e2e3a",
		bg_search = "#3a3348",
		fg = "#e1e1e1",
		fg_soft = "#c8c8c8",
		fg_dim = "#8a8a8a",
		muted = "#6c6c6c",
		border = "#2e2e2e",
		comment = "#6c6c6c",
		accent = "#bb9af7",
		blue = "#7aa2f7",
		teal = "#1abc9c",
		cyan = "#3a95ab",
		green = "#9ece6a",
		amber = "#e0af68",
		red = "#f7768e",
		orange = "#ff9e64",
		white = "#e1e1e1",
		black = "#141414",
		diff_add = "#1a2b1a",
		diff_change = "#2a2430",
		diff_delete = "#2b1a1a",
		diff_text = "#3a3048",
		whitespace = "#303030",
		diag_error_bg = "#1f1518",
		diag_warn_bg = "#1f1a14",
		diag_info_bg = "#151820",
		diag_hint_bg = "#141c1a",
		ansi_black = "#141414",
		ansi_bright_black = "#6c6c6c",
		-- UI chrome. Same as the magenta accent in the dark theme.
		chrome = "#bb9af7",
		emphasis = "#e0af68",
	},
	-- GrokDay from grok-build theme/grokday.rs.
	-- Surfaces are a neutral gray ramp. accent_user is #444444, not magenta.
	light = {
		none = "NONE",
		bg = "#eeeeee",
		bg_elevated = "#e4e4e4",
		bg_float = "#f5f5f5",
		bg_highlight = "#dedede",
		bg_visual = "#c6c6c6",
		bg_search = "#dedede",
		fg = "#262626",
		fg_soft = "#444444",
		fg_dim = "#626262",
		muted = "#767676",
		border = "#c8c8cd",
		comment = "#767676",
		accent = "#7d4bc6",
		blue = "#2f64d2",
		teal = "#0a8e70",
		cyan = "#0082aa",
		green = "#378e23",
		amber = "#a27612",
		red = "#cd3048",
		orange = "#c3691e",
		white = "#f5f5f5",
		black = "#262626",
		diff_add = "#daf2dc",
		diff_change = "#dedede",
		diff_delete = "#f5dade",
		diff_text = "#e4e4e4",
		whitespace = "#d0d0d0",
		diag_error_bg = "#f5dade",
		diag_warn_bg = "#f5f0dc",
		diag_info_bg = "#e4eaf8",
		diag_hint_bg = "#e3f3ef",
		ansi_black = "#262626",
		ansi_bright_black = "#767676",
		chrome = "#444444",
		emphasis = "#262626",
	},
}

function M.apply(mode)
	local c = palettes[mode] or palettes.dark

	local function hi(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- Editor
	hi("Normal", { fg = c.fg, bg = c.bg })
	hi("NormalNC", { fg = c.fg_soft, bg = c.bg })
	hi("NormalFloat", { fg = c.fg, bg = c.bg_float })
	hi("FloatBorder", { fg = c.border, bg = c.bg_float })
	hi("FloatTitle", { fg = c.chrome, bg = c.bg_float })
	hi("Cursor", { fg = c.bg, bg = c.chrome })
	hi("lCursor", { fg = c.bg, bg = c.chrome })
	hi("CursorIM", { fg = c.bg, bg = c.chrome })
	hi("CursorLine", { bg = c.bg_elevated })
	hi("CursorColumn", { bg = c.bg_elevated })
	hi("ColorColumn", { bg = c.bg_elevated })
	hi("CursorLineNr", { fg = c.emphasis })
	hi("LineNr", { fg = c.muted })
	hi("LineNrAbove", { fg = c.muted })
	hi("LineNrBelow", { fg = c.muted })
	hi("SignColumn", { fg = c.muted, bg = c.bg })
	hi("Folded", { fg = c.fg_dim, bg = c.bg_elevated })
	hi("FoldColumn", { fg = c.muted, bg = c.bg })
	hi("MatchParen", { fg = c.amber, bg = c.bg_highlight })
	hi("NonText", { fg = c.muted })
	hi("SpecialKey", { fg = c.muted })
	hi("Whitespace", { fg = c.whitespace })
	hi("EndOfBuffer", { fg = c.bg })
	hi("Visual", { bg = c.bg_visual })
	hi("VisualNOS", { bg = c.bg_visual })
	hi("Search", { fg = c.fg, bg = c.bg_search })
	hi("IncSearch", { fg = c.bg, bg = c.amber })
	hi("CurSearch", { fg = c.bg, bg = c.amber })
	hi("Substitute", { fg = c.bg, bg = c.amber })
	hi("Directory", { fg = c.blue })
	hi("Title", { fg = c.chrome })
	hi("Question", { fg = c.blue })
	hi("MoreMsg", { fg = c.green })
	hi("ModeMsg", { fg = c.fg_soft })
	hi("ErrorMsg", { fg = c.red })
	hi("WarningMsg", { fg = c.amber })
	hi("MsgArea", { fg = c.fg })
	hi("MsgSeparator", { fg = c.border, bg = c.bg })
	hi("WildMenu", { fg = c.bg, bg = c.chrome })
	hi("Pmenu", { fg = c.fg, bg = c.bg_elevated })
	hi("PmenuSel", { fg = c.fg, bg = c.bg_highlight })
	hi("PmenuSbar", { bg = c.bg_elevated })
	hi("PmenuThumb", { bg = c.muted })
	hi("PmenuKind", { fg = c.chrome, bg = c.bg_elevated })
	hi("PmenuExtra", { fg = c.muted, bg = c.bg_elevated })
	hi("StatusLine", { fg = c.fg_soft, bg = c.bg_elevated })
	hi("StatusLineNC", { fg = c.muted, bg = c.bg_float })
	hi("WinBar", { fg = c.fg_soft, bg = c.bg })
	hi("WinBarNC", { fg = c.muted, bg = c.bg })
	hi("TabLine", { fg = c.muted, bg = c.bg_float })
	hi("TabLineFill", { bg = c.bg })
	hi("TabLineSel", { fg = c.emphasis, bg = c.bg })
	hi("VertSplit", { fg = c.border })
	hi("WinSeparator", { fg = c.border })
	hi("QuickFixLine", { bg = c.bg_elevated })
	hi("SpellBad", { sp = c.red, undercurl = true })
	hi("SpellCap", { sp = c.amber, undercurl = true })
	hi("SpellLocal", { sp = c.teal, undercurl = true })
	hi("SpellRare", { sp = c.blue, undercurl = true })
	hi("Conceal", { fg = c.muted })

	-- Syntax
	hi("Comment", { fg = c.comment })
	hi("Constant", { fg = c.orange })
	hi("String", { fg = c.green })
	hi("Character", { fg = c.green })
	hi("Number", { fg = c.orange })
	hi("Boolean", { fg = c.orange })
	hi("Float", { fg = c.orange })
	hi("Identifier", { fg = c.fg })
	hi("Function", { fg = c.blue })
	hi("Statement", { fg = c.accent })
	hi("Conditional", { fg = c.accent })
	hi("Repeat", { fg = c.accent })
	hi("Label", { fg = c.blue })
	hi("Operator", { fg = c.fg_soft })
	hi("Keyword", { fg = c.accent })
	hi("Exception", { fg = c.accent })
	hi("PreProc", { fg = c.cyan })
	hi("Include", { fg = c.accent })
	hi("Define", { fg = c.accent })
	hi("Macro", { fg = c.cyan })
	hi("PreCondit", { fg = c.cyan })
	hi("Type", { fg = c.teal })
	hi("StorageClass", { fg = c.accent })
	hi("Structure", { fg = c.teal })
	hi("Typedef", { fg = c.teal })
	hi("Special", { fg = c.blue })
	hi("SpecialChar", { fg = c.orange })
	hi("Tag", { fg = c.red })
	hi("Delimiter", { fg = c.fg_dim })
	hi("SpecialComment", { fg = c.fg_dim })
	hi("Debug", { fg = c.red })
	hi("Underlined", { underline = true })
	hi("Ignore", { fg = c.muted })
	hi("Error", { fg = c.red })
	hi("Todo", { fg = c.amber, bg = c.bg_elevated })

	-- Diff
	hi("DiffAdd", { bg = c.diff_add })
	hi("DiffChange", { bg = c.diff_change })
	hi("DiffDelete", { fg = c.red, bg = c.diff_delete })
	hi("DiffText", { bg = c.diff_text })
	hi("diffAdded", { fg = c.green })
	hi("diffRemoved", { fg = c.red })
	hi("diffChanged", { fg = c.amber })
	hi("diffFile", { fg = c.blue })
	hi("diffIndexLine", { fg = c.accent })
	hi("diffLine", { fg = c.cyan })
	hi("diffNewFile", { fg = c.green })
	hi("diffOldFile", { fg = c.red })

	-- Diagnostics
	hi("DiagnosticError", { fg = c.red })
	hi("DiagnosticWarn", { fg = c.amber })
	hi("DiagnosticInfo", { fg = c.blue })
	hi("DiagnosticHint", { fg = c.teal })
	hi("DiagnosticOk", { fg = c.green })
	hi("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
	hi("DiagnosticUnderlineWarn", { sp = c.amber, undercurl = true })
	hi("DiagnosticUnderlineInfo", { sp = c.blue, undercurl = true })
	hi("DiagnosticUnderlineHint", { sp = c.teal, undercurl = true })
	hi("DiagnosticUnderlineOk", { sp = c.green, undercurl = true })
	hi("DiagnosticVirtualTextError", { fg = c.red, bg = c.diag_error_bg })
	hi("DiagnosticVirtualTextWarn", { fg = c.amber, bg = c.diag_warn_bg })
	hi("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.diag_info_bg })
	hi("DiagnosticVirtualTextHint", { fg = c.teal, bg = c.diag_hint_bg })
	hi("DiagnosticSignError", { fg = c.red })
	hi("DiagnosticSignWarn", { fg = c.amber })
	hi("DiagnosticSignInfo", { fg = c.blue })
	hi("DiagnosticSignHint", { fg = c.teal })
	hi("DiagnosticFloatingError", { fg = c.red })
	hi("DiagnosticFloatingWarn", { fg = c.amber })
	hi("DiagnosticFloatingInfo", { fg = c.blue })
	hi("DiagnosticFloatingHint", { fg = c.teal })

	-- LSP
	hi("LspReferenceText", { bg = c.bg_highlight })
	hi("LspReferenceRead", { bg = c.bg_highlight })
	hi("LspReferenceWrite", { bg = c.bg_highlight })
	hi("LspSignatureActiveParameter", { fg = c.amber })
	hi("LspCodeLens", { fg = c.muted })
	hi("LspCodeLensSeparator", { fg = c.border })
	hi("LspInlayHint", { fg = c.muted, bg = c.bg_float })

	-- Treesitter
	hi("@comment", { fg = c.comment })
	hi("@comment.todo", { fg = c.amber })
	hi("@comment.warning", { fg = c.amber })
	hi("@comment.error", { fg = c.red })
	hi("@comment.note", { fg = c.blue })
	hi("@constant", { fg = c.orange })
	hi("@constant.builtin", { fg = c.orange })
	hi("@constant.macro", { fg = c.cyan })
	hi("@string", { fg = c.green })
	hi("@string.escape", { fg = c.orange })
	hi("@string.regexp", { fg = c.cyan })
	hi("@string.special", { fg = c.orange })
	hi("@character", { fg = c.green })
	hi("@number", { fg = c.orange })
	hi("@boolean", { fg = c.orange })
	hi("@float", { fg = c.orange })
	hi("@function", { fg = c.blue })
	hi("@function.builtin", { fg = c.blue })
	hi("@function.call", { fg = c.blue })
	hi("@function.macro", { fg = c.cyan })
	hi("@method", { fg = c.blue })
	hi("@method.call", { fg = c.blue })
	hi("@constructor", { fg = c.teal })
	hi("@parameter", { fg = c.fg_soft })
	hi("@keyword", { fg = c.accent })
	hi("@keyword.function", { fg = c.accent })
	hi("@keyword.operator", { fg = c.accent })
	hi("@keyword.return", { fg = c.accent })
	hi("@keyword.import", { fg = c.accent })
	hi("@keyword.conditional", { fg = c.accent })
	hi("@keyword.repeat", { fg = c.accent })
	hi("@keyword.exception", { fg = c.accent })
	hi("@operator", { fg = c.fg_soft })
	hi("@variable", { fg = c.fg })
	hi("@variable.builtin", { fg = c.red })
	hi("@variable.parameter", { fg = c.fg_soft })
	hi("@variable.member", { fg = c.fg })
	hi("@property", { fg = c.fg })
	hi("@field", { fg = c.fg })
	hi("@type", { fg = c.teal })
	hi("@type.builtin", { fg = c.teal })
	hi("@type.definition", { fg = c.teal })
	hi("@namespace", { fg = c.teal })
	hi("@module", { fg = c.teal })
	hi("@attribute", { fg = c.cyan })
	hi("@annotation", { fg = c.cyan })
	hi("@label", { fg = c.blue })
	hi("@punctuation", { fg = c.fg_dim })
	hi("@punctuation.delimiter", { fg = c.fg_dim })
	hi("@punctuation.bracket", { fg = c.fg_dim })
	hi("@punctuation.special", { fg = c.orange })
	hi("@tag", { fg = c.red })
	hi("@tag.attribute", { fg = c.accent })
	hi("@tag.delimiter", { fg = c.fg_dim })
	hi("@markup.heading", { fg = c.accent })
	hi("@markup.heading.1", { fg = c.accent })
	hi("@markup.heading.2", { fg = c.blue })
	hi("@markup.heading.3", { fg = c.teal })
	hi("@markup.heading.4", { fg = c.amber })
	hi("@markup.strong", { fg = c.amber })
	hi("@markup.italic", { fg = c.fg_soft })
	hi("@markup.strikethrough", { fg = c.muted, strikethrough = true })
	hi("@markup.underline", { underline = true })
	hi("@markup.link", { fg = c.blue })
	hi("@markup.link.url", { fg = c.cyan, underline = true })
	hi("@markup.link.label", { fg = c.accent })
	hi("@markup.list", { fg = c.accent })
	hi("@markup.raw", { fg = c.green })
	hi("@markup.quote", { fg = c.fg_dim })
	hi("@diff.plus", { fg = c.green })
	hi("@diff.minus", { fg = c.red })
	hi("@diff.delta", { fg = c.amber })

	-- Languages often used in this setup
	hi("@type.php", { fg = c.teal })
	hi("@function.method.php", { fg = c.blue })
	hi("@variable.php", { fg = c.fg })

	-- GitSigns
	hi("GitSignsAdd", { fg = c.green })
	hi("GitSignsChange", { fg = c.amber })
	hi("GitSignsDelete", { fg = c.red })
	hi("GitSignsCurrentLineBlame", { fg = c.muted })

	-- mini.statusline
	hi("MiniStatuslineModeNormal", { fg = c.bg, bg = c.chrome })
	hi("MiniStatuslineModeInsert", { fg = c.bg, bg = c.green })
	hi("MiniStatuslineModeVisual", { fg = c.bg, bg = c.amber })
	hi("MiniStatuslineModeReplace", { fg = c.bg, bg = c.red })
	hi("MiniStatuslineModeCommand", { fg = c.bg, bg = c.blue })
	hi("MiniStatuslineModeOther", { fg = c.bg, bg = c.teal })
	hi("MiniStatuslineDevinfo", { fg = c.fg_soft, bg = c.bg_elevated })
	hi("MiniStatuslineFilename", { fg = c.fg_soft, bg = c.bg_float })
	hi("MiniStatuslineFileinfo", { fg = c.muted, bg = c.bg_elevated })
	hi("MiniStatuslineInactive", { fg = c.muted, bg = c.bg_float })

	-- barbar
	hi("BufferCurrent", { fg = c.emphasis, bg = c.bg })
	hi("BufferCurrentIndex", { fg = c.emphasis, bg = c.bg })
	hi("BufferCurrentMod", { fg = c.red, bg = c.bg })
	hi("BufferCurrentSign", { fg = c.chrome, bg = c.bg })
	hi("BufferCurrentTarget", { fg = c.red, bg = c.bg })
	hi("BufferVisible", { fg = c.fg_soft, bg = c.bg_float })
	hi("BufferVisibleIndex", { fg = c.fg_soft, bg = c.bg_float })
	hi("BufferVisibleMod", { fg = c.amber, bg = c.bg_float })
	hi("BufferVisibleSign", { fg = c.muted, bg = c.bg_float })
	hi("BufferVisibleTarget", { fg = c.red, bg = c.bg_float })
	hi("BufferInactive", { fg = c.muted, bg = c.bg_float })
	hi("BufferInactiveIndex", { fg = c.muted, bg = c.bg_float })
	hi("BufferInactiveMod", { fg = c.amber, bg = c.bg_float })
	hi("BufferInactiveSign", { fg = c.border, bg = c.bg_float })
	hi("BufferInactiveTarget", { fg = c.red, bg = c.bg_float })
	hi("BufferTabpages", { fg = c.chrome, bg = c.bg_float })
	hi("BufferTabpageFill", { fg = c.muted, bg = c.bg })
	hi("BufferOffset", { fg = c.muted, bg = c.bg })

	-- blink.cmp
	hi("BlinkCmpMenu", { fg = c.fg, bg = c.bg_elevated })
	hi("BlinkCmpMenuBorder", { fg = c.border, bg = c.bg_elevated })
	hi("BlinkCmpMenuSelection", { fg = c.fg, bg = c.bg_highlight })
	hi("BlinkCmpLabel", { fg = c.fg })
	hi("BlinkCmpLabelMatch", { fg = c.chrome })
	hi("BlinkCmpLabelDeprecated", { fg = c.muted, strikethrough = true })
	hi("BlinkCmpKind", { fg = c.blue })
	hi("BlinkCmpSource", { fg = c.muted })
	hi("BlinkCmpDoc", { fg = c.fg, bg = c.bg_float })
	hi("BlinkCmpDocBorder", { fg = c.border, bg = c.bg_float })
	hi("BlinkCmpSignatureHelp", { fg = c.fg, bg = c.bg_float })
	hi("BlinkCmpSignatureHelpBorder", { fg = c.border, bg = c.bg_float })
	hi("BlinkCmpSignatureHelpActiveParameter", { fg = c.amber })

	-- fzf-lua
	hi("FzfLuaNormal", { fg = c.fg, bg = c.bg_float })
	hi("FzfLuaBorder", { fg = c.border, bg = c.bg_float })
	hi("FzfLuaTitle", { fg = c.chrome, bg = c.bg_float })
	hi("FzfLuaPreviewNormal", { fg = c.fg, bg = c.bg })
	hi("FzfLuaPreviewBorder", { fg = c.border, bg = c.bg })
	hi("FzfLuaCursor", { fg = c.bg, bg = c.chrome })
	hi("FzfLuaCursorLine", { bg = c.bg_elevated })
	hi("FzfLuaSearch", { fg = c.amber })
	hi("FzfLuaPathLineNr", { fg = c.green })
	hi("FzfLuaPathColNr", { fg = c.blue })
	hi("FzfLuaBufName", { fg = c.chrome })
	hi("FzfLuaBufNr", { fg = c.amber })
	hi("FzfLuaBufFlagCur", { fg = c.red })
	hi("FzfLuaBufFlagAlt", { fg = c.cyan })
	hi("FzfLuaHeaderBind", { fg = c.amber })
	hi("FzfLuaHeaderText", { fg = c.red })

	-- which-key
	hi("WhichKey", { fg = c.chrome })
	hi("WhichKeyGroup", { fg = c.blue })
	hi("WhichKeyDesc", { fg = c.fg })
	hi("WhichKeySeparator", { fg = c.muted })
	hi("WhichKeyFloat", { bg = c.bg_float })
	hi("WhichKeyBorder", { fg = c.border, bg = c.bg_float })
	hi("WhichKeyValue", { fg = c.fg_dim })

	-- Telescope (if used later)
	hi("TelescopeNormal", { fg = c.fg, bg = c.bg_float })
	hi("TelescopeBorder", { fg = c.border, bg = c.bg_float })
	hi("TelescopeTitle", { fg = c.chrome })
	hi("TelescopeSelection", { bg = c.bg_elevated })
	hi("TelescopeMatching", { fg = c.chrome })
	hi("TelescopePromptPrefix", { fg = c.chrome })

	-- Lazy
	hi("LazyNormal", { fg = c.fg, bg = c.bg_float })
	hi("LazyButton", { fg = c.fg_soft, bg = c.bg_elevated })
	hi("LazyButtonActive", { fg = c.bg, bg = c.chrome })
	hi("LazyH1", { fg = c.bg, bg = c.chrome })
	hi("LazyH2", { fg = c.chrome })
	hi("LazyProgressDone", { fg = c.green })
	hi("LazyProgressTodo", { fg = c.muted })
	hi("LazySpecial", { fg = c.blue })
	hi("LazyComment", { fg = c.muted })

	-- Mason
	hi("MasonHeader", { fg = c.bg, bg = c.chrome })
	hi("MasonHeaderSecondary", { fg = c.bg, bg = c.blue })
	hi("MasonHighlight", { fg = c.chrome })
	hi("MasonHighlightBlock", { fg = c.bg, bg = c.chrome })
	hi("MasonMuted", { fg = c.muted })
	hi("MasonMutedBlock", { fg = c.muted, bg = c.bg_elevated })

	-- Diffview
	hi("DiffviewNormal", { fg = c.fg, bg = c.bg })
	hi("DiffviewFilePanelTitle", { fg = c.chrome })
	hi("DiffviewFilePanelCounter", { fg = c.blue })
	hi("DiffviewFilePanelFileName", { fg = c.fg })
	hi("DiffviewFolderName", { fg = c.blue })
	hi("DiffviewFolderSign", { fg = c.blue })
	hi("DiffviewStatusAdded", { fg = c.green })
	hi("DiffviewStatusUntracked", { fg = c.green })
	hi("DiffviewStatusModified", { fg = c.amber })
	hi("DiffviewStatusRenamed", { fg = c.blue })
	hi("DiffviewStatusDeleted", { fg = c.red })

	-- Terminal ANSI (matches the active Ghostty Grok theme)
	hi("TermCursor", { fg = c.bg, bg = c.chrome })
	vim.g.terminal_color_0 = c.ansi_black
	vim.g.terminal_color_1 = c.red
	vim.g.terminal_color_2 = c.green
	vim.g.terminal_color_3 = c.amber
	vim.g.terminal_color_4 = c.blue
	vim.g.terminal_color_5 = c.accent
	vim.g.terminal_color_6 = c.teal
	vim.g.terminal_color_7 = c.fg_soft
	vim.g.terminal_color_8 = c.ansi_bright_black
	vim.g.terminal_color_9 = c.red
	vim.g.terminal_color_10 = c.green
	vim.g.terminal_color_11 = c.amber
	vim.g.terminal_color_12 = c.blue
	vim.g.terminal_color_13 = c.accent
	vim.g.terminal_color_14 = c.cyan
	vim.g.terminal_color_15 = c.fg

end

return M
