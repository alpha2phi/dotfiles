---@diagnostic disable: undefined-global
-- local lush = require("lush")
local onedarkpro = require("onedarkpro")
local odp_utils = require("onedarkpro.utils")
local catppuccino = require("catppuccin")

-- tokyonight
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "symbols_outline", "aerial", "trouble" }

-- configure catppuccino
catppuccino.setup({
	transparent_background = false,
	term_colors = false,
	styles = {
		comments = "italic",
		functions = "bold,italic",
		keywords = "italic",
		strings = "NONE",
		variables = "bold",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_trouble = false,
		lsp_saga = true,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = false,
			show_root = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = false,
			colored_indent_levels = false,
		},
		dashboard = false,
		neogit = true,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = false,
		lightspeed = false,
		ts_rainbow = true,
		hop = false,
	},
})

-- configure neon$$
vim.g.neon_style = "light"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_functions = true
vim.g.neon_italic_variable = true
vim.g.neon_bold = true
vim.g.neon_transparent = true

--lush colorschemes

-- navarasu/onedark.nvim
-- vim.g.onedark_style = "warmer"
-- require("onedark").setup()

-- olimorris/onedarkpro.nvim
local colors = {
	bg = "#d3f7d9",
	fg = "#707070",
	red = "#e05661",
	orange = "#ff3377",
	yellow = "#ee9025",
	green = "#1da912",
	cyan = "#00ffff",
	blue = "#56b6c2",
	purple = "#9a77cf",
	white = "#fafafa",
	black = "#3f3f3f",
	gray = "#bebebe",
	highlight = "#efdebd",
}
onedarkpro.setup({
	colors = {
		bg = colors.bg,
		fg = colors.fg,
		red = colors.red,
		orange = colors.orange,
		yellow = colors.yellow,
		green = colors.green,
		cyan = colors.cyan,
		blue = colors.blue,
		purple = colors.purple,
		white = colors.white,
		black = colors.black,
		gray = colors.gray,
		highlight = colors.highlight,
		cursorline = odp_utils.darken(colors.bg, 0.97),
		comment = odp_utils.darken(colors.gray, 0.80),
		selection = odp_utils.darken(colors.bg, 0.90),
		color_column = odp_utils.darken(colors.bg, 0.98),
		indentline = odp_utils.darken(colors.bg, 0.93),
		menu = odp_utils.darken(colors.bg, 0.95),
		menu_scroll = odp_utils.darken(colors.bg, 0.90),
		menu_scroll_thumb = odp_utils.lighten(colors.blue, 0.80),
	},
	-- hlgroups = {
	-- 	TabLineFill = { bg = odp_utils.lighten(colors.cyan, 0.50), fg = colors.bg },
	-- 	TabLine = { bg = odp_utils.lighten(colors.cyan, 0.50), fg = colors.bg },
	-- 	TabLineSel = { bg = odp_utils.lighten(colors.cyan, 0.50), fg = colors.bg },
	-- },
	styles = {
		strings = "NONE", -- Style that is applied to strings
		comments = "NONE", -- Style that is applied to comments
		keywords = "bold", -- Style that is applied to keywords
		functions = "italic,underline", -- Style that is applied to functions
		variables = "italic,bold", -- Style that is applied to variables
	},
	options = {
		bold = true, -- Use the themes opinionated bold styles?
		italic = true, -- Use the themes opinionated italic styles?
		underline = true, -- Use the themes opinionated underline styles?
		undercurl = true, -- Use the themes opinionated undercurl styles?
		cursorline = true,
		transparency = false, -- Use a transparent background?
		terminal_colors = true,
		window_unfocussed_color = true,
	},
})
-- onedarkpro.load("onelight")

-- vim.g.lush_jsx_contrast_dark = "hard"
-- vim.g.lush_jsx_contrast_light = "hard"
-- lush(require("lush_jsx").setup({
-- 	plugins = {
-- 		"cmp", -- nvim-cmp
-- 		"gitsigns",
-- 		"lsp",
-- 		"lspsaga",
-- 		"neogit",
-- 		"telescope",
-- 		"treesitter",
-- 	},
-- 	langs = {
-- 		"clojure",
-- 		"csharp",
-- 		"css",
-- 		"html",
-- 		"js",
-- 		"json",
-- 		"jsx",
-- 		"lua",
-- 		"markdown",
-- 		"python",
-- 		"typescript",
-- 		"viml",
-- 		"xml",
-- 	},
-- }))

--kat.nvim
vim.g.kat_nvim_commentStyle = "italic"
vim.g.kat_nvim_integrations = { "lsp", "treesitter", "ts_rainbow", "cmp" } --, "bufferline" }
vim.g.kat_nvim_stupidFeatures = false
