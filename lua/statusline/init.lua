local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = { "LuaTree", "CHADTREE", "OUTLINE" }
local i = require("statusline.icons")
local c = require("statusline.colors")
local u = require("statusline.utils")
local diagnostic = require("statusline.providers.diagnostic")
local vcs = require("statusline.providers.vcs")
local fileinfo = require("statusline.providers.fileinfo")
local extension = require("statusline.providers.extension")
local buffer = require("statusline.providers.buffer")
local vimode = require("statusline.providers.vimode")

bufferIcon = buffer.get_buffer_type_icon
bufferNumber = buffer.get_buffer_number
diagnosticError = diagnostic.get_diagnostic_error
diagnosticWarn = diagnostic.get_diagnostic_warn
diagnosticInfo = diagnostic.get_diagnostic_info
diagnosticEndSpace = diagnostic.end_space
diagnosticSeperator = diagnostic.seperator
diffAdd = vcs.diff_add
diffModified = vcs.diff_modified
diffRemove = vcs.diff_remove
fileFormat = fileinfo.get_file_format
fileEncode = fileinfo.get_file_encode
fileSize = fileinfo.get_file_size
fileIcon = fileinfo.get_file_icon
fileName = fileinfo.get_current_file_name
fileType = fileinfo.get_file_type
fileTypeName = buffer.get_buffer_filetype
filetTypeSeperator = fileinfo.filetype_seperator
gitBranch = vcs.get_git_branch_formatted
gitSeperatorLeft = vcs.seperatorLeft
gitSeperatorRight = vcs.seperatorRight
lineColumn = fileinfo.line_column
linePercent = fileinfo.current_line_percent
scrollBar = extension.scrollbar_instance
space = u.space
viMode = vimode.get_mode
viModeSeperator = vimode.seperator

gls.left[1] = {
	ViMode = {
		provider = viMode,
		highlight = { c.Color("act1"), c.Color("DarkGoldenrod2") },
	},
}

gls.left[2] = {
	ViModeSeperator = {
		provider = viModeSeperator,
		highlight = { c.Color("act1"), c.Color("DarkGoldenrod2") },
	},
}

gls.left[3] = {
	FileSize = {
		provider = fileSize,
		condition = u.buffer_not_empty,
		highlight = { c.Color("base"), c.Color("act1") },
		separator = i.slant.Right,
		separator_highlight = { c.Color("act1"), c.Color("cyan") },
	},
}

gls.left[4] = {
	FileName = {
		provider = fileName,
		condition = u.buffer_not_empty,
	},
}

gls.left[5] = {
	FileNameSeparator = {
		provider = function()
			return " " .. i.slant.Right
		end,
		highlight = { c.Color("cyan"), c.Color("purple") },
		condition = u.buffer_not_empty,
	},
}

gls.left[6] = {
	FileType = {
		provider = function()
			return " " .. fileType()
		end,
		condition = u.buffer_not_empty,
		highlight = { c.Color("base"), c.Color("purple") },
	},
}

gls.left[7] = {
	FiletTypeSeperator = {
		provider = filetTypeSeperator,
	},
}

gls.left[8] = {
	DiagnosticError = {
		provider = diagnosticError,
		icon = " " .. i.diagnostic.error,
		highlight = { c.Color("error"), c.Color("act1") },
	},
}

gls.left[9] = {
	DiagnosticWarn = {
		provider = diagnosticWarn,
		icon = " " .. i.diagnostic.warn,
		highlight = { c.Color("warning"), c.Color("act1") },
	},
}

gls.left[10] = {
	DiagnosticInfo = {
		provider = diagnosticInfo,
		icon = " " .. i.diagnostic.info,
		highlight = { c.Color("info"), c.Color("act1") },
	},
}
gls.left[11] = {
	DiagnosticEndSpace = {
		provider = diagnosticEndSpace,
		highlight = { c.Color("act1"), c.Color("act1") },
	},
}
gls.left[12] = {
	DiagnosticSeperator = {
		provider = diagnosticSeperator,
		highlight = { c.Color("purple"), c.Color("act1") },
	},
}
-- gls.left[13] = {
-- 	GitBranch = {
-- 		provider = gitBranch,
-- 		icon = "  " .. i.git .. " ",
-- 		condition = u.buffer_not_empty,
-- 	},
-- }
gls.left[13] = {
	GitSeperatorLeft = {
		provider = gitSeperatorLeft,
		condition = u.buffer_not_empty,
	},
}
gls.left[14] = {
	DiffAdd = {
		provider = diffAdd,
		condition = u.checkwidth,
		icon = " " .. i.diff.Add .. " ",
		highlight = { c.Color("green"), c.Color("purple") },
	},
}
gls.left[15] = {
	DiffModified = {
		provider = diffModified,
		condition = u.checkwidth,
		icon = " " .. i.diff.Modified .. " ",
		highlight = { c.Color("orange"), c.Color("purple") },
	},
}
gls.left[16] = {
	DiffRemove = {
		provider = diffRemove,
		condition = u.checkwidth,
		icon = " " .. i.diff.Remove .. " ",
		highlight = { c.Color("red"), c.Color("purple") },
	},
}
gls.left[17] = {
	ViModeSeperatorAltInverse = {
		provider = function()
			return i.slant.Right
		end,
	},
}

gls.right[1] = {
	FileFormat = {
		provider = fileFormat,
		highlight = { c.Color("base"), c.Color("purple") },
		separator = i.slant.Left,
		separator_highlight = function()
			return { c.Color("purple"), c.Color("vimode") }
		end,
		event = "ModeChanged",
	},
}
gls.right[2] = {
	LineInfo = {
		provider = lineColumn,
		separator = " | ",
		separator_highlight = { c.Color("base"), c.Color("purple") },
		highlight = { c.Color("base"), c.Color("purple") },
	},
}
gls.right[3] = {
	PerCent = {
		provider = linePercent,
		separator = i.slant.Left,
		separator_highlight = { c.Color("act1"), c.Color("purple") },
		highlight = { c.Color("base"), c.Color("act1") },
	},
}
gls.right[4] = {
	ScrollBar = {
		provider = scrollBar,
		highlight = { c.Color("DarkGoldenrod2"), c.Color("purple") },
	},
}

gls.short_line_left[1] = {
	BufferTypeAlt = {
		provider = fileTypeName,
		separator = i.slant.Right,
		separator_highlight = { c.Color("purple"), c.Color("DarkGoldenrod2") },
		highlight = { c.Color("base"), c.Color("purple") },
	},
}

gls.short_line_left[2] = {
	FileNameAlt = {
		provider = fileName,
		condition = u.buffer_not_empty,
		separator = i.slant.Right,
		separator_highlight = { c.Color("cyan"), c.Color("act1") },
		highlight = { c.Color("act1"), c.Color("cyan"), "bold" },
	},
}

gls.short_line_left[3] = {
	SpaceAlt = {
		provider = space,
		highlight = { c.Color("blue"), c.Color("act1") },
	},
}

gls.short_line_right[1] = {
	BufferIconAlt = {
		provider = bufferIcon,
		separator = i.slant.Left,
		separator_highlight = { c.Color("purple"), c.Color("bg") },
		highlight = { c.Color("base"), c.Color("purple") },
	},
}
