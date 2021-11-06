require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	indent = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = {},
		termcolors = {},
	},
	refactor = {
		smart_rename = {
			enable = false, --true,
			keymaps = {
				smart_rename = nil, --"gR",
			},
		},
	},
	autopairs = { enable = true },
	context_commentstring = {
		enable = true,
	},
})

require("nvim-gps").setup({
	icons = {
		["class-name"] = " ", -- Classes and class-like objects
		["function-name"] = " ", -- Functions
		["method-name"] = " ", -- Methods (functions inside class-like objects)
		["container-name"] = "ﭞ ", -- Containers (example: lua tables)
		["tag-name"] = "炙", -- Tags (example: html tags)
	},
	separator = " ﲖ ",
})

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
