vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

local config = {}

function config.setup()
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
				init_selection = "<leader>v",
				node_incremental = "s[",
				scope_incremental = "s{",
				node_decremental = "S[",
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
				goto_previous_start = {
					["[af"] = "@function.outer",
					["[if"] = "@function.inner",
					["[am"] = "@class.outer",
					["[im"] = "@class.inner",
					["[ab"] = "@block.outer",
					["[ib"] = "@block.inner",
					["[a?"] = "@conditional.outer",
					["[i?"] = "@conditional.inner",
					["[ax"] = "@loop.outer",
					["[ix"] = "@loop.inner",
				},
				goto_previous_end = {
					["[Af"] = "@function.outer",
					["[If"] = "@function.inner",
					["[Am"] = "@class.outer",
					["[Im"] = "@class.inner",
					["[Ab"] = "@block.outer",
					["[Ib"] = "@block.inner",
					["[A?"] = "@conditional.outer",
					["[I?"] = "@conditional.inner",
					["[Ax"] = "@loop.outer",
					["[Ix"] = "@loop.inner",
				},
				goto_next_start = {
					["]af"] = "@function.outer",
					["]if"] = "@function.inner",
					["]am"] = "@class.outer",
					["]im"] = "@class.inner",
					["]ab"] = "@block.outer",
					["]ib"] = "@block.inner",
					["]a?"] = "@conditional.outer",
					["]i?"] = "@conditional.inner",
					["]ax"] = "@loop.outer",
					["]ix"] = "@loop.inner",
				},
				goto_next_end = {
					["]Af"] = "@function.outer",
					["]If"] = "@function.inner",
					["]Am"] = "@class.outer",
					["]Im"] = "@class.inner",
					["]Ab"] = "@block.outer",
					["]Ib"] = "@block.inner",
					["]A?"] = "@conditional.outer",
					["]I?"] = "@conditional.inner",
					["]Ax"] = "@loop.outer",
					["]Ix"] = "@loop.inner",
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
					["am"] = "@class.outer",
					["im"] = "@class.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["a?"] = "@conditional.outer",
					["i?"] = "@conditional.inner",
					["ax"] = "@loop.outer",
					["ix"] = "@loop.inner",
				},
			},
		},
		textsubjects = {
			enable = true,
			prev_selection = ",",
			keymaps = {
				["."] = "textsubjects-smart",
				[";"] = "textsubjects-container-outer",
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
end

return config
