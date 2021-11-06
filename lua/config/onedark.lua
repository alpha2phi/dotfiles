local onedark = require("onedark")
local c = require("onedark.colors").load()

onedark.setup({
	styles = {
		comments = "NONE",
		functions = "italic",
		keywords = "bold,italic",
		strings = "NONE",
		variables = "italic",
	},
	hlgroups = {
		CursorColumn = { bg = "#333333" },
		CursorLine = { bg = "#333333" },
		TabLineFill = { bg = c.purple, fg = c.cyan },
		TablineSel = { bg = c.purple, fg = c.white },
		Tabline = { bg = c.blue, fg = c.gray },
	},
	colors = {
		cursorline = "#777777",
	},
	options = {
		highlight_cursorline = true,
	},
})
