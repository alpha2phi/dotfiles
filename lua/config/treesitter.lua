require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	indent = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>S",
			node_incremental = "<leader>s>",
			scope_incremental = "<leader>s{",
			node_decremental = "<leader>s<",
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		-- colors = {},
		-- termcolors = {},
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
	autotag = { enable = true },
	context_commentstring = {
		enable = true,
	},
	textobjects = {
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]["] = "@function.outer",
				["]m"] = "@class.outer",
			},
			goto_next_end = {
				["]]"] = "@function.outer",
				["]M"] = "@class.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
				["[m"] = "@class.outer",
			},
			goto_previous_end = {
				["[]"] = "@function.outer",
				["[M"] = "@class.outer",
			},
		},
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	textsubjects = {
		enable = true,
		keymaps = {
			["<cr>"] = "textsubjects-smart", -- works in visual mode
		},
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
