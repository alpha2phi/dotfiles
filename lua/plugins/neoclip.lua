local config = {}

function config.setup()
	require("neoclip").setup({
		history = 1000,
		enable_persistent_history = true,
		continuous_sync = true,
		db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
		filter = function()
			return true
		end,
		preview = true,
		default_register = '"',
		default_register_macros = "q",
		enable_macro_history = true,
		content_spec_column = false,
		on_paste = {
			set_reg = false,
		},
		on_replay = {
			set_reg = false,
		},
		keys = {
			telescope = {
				i = {
					select = "<cr>",
					paste = "<c-p>",
					paste_behind = "<c-P>",
					replay = "<c-q>",
					delete = "<c-d>",
					custom = {},
				},
				n = {
					select = "<cr>",
					paste = "p",
					paste_behind = "P",
					replay = "q",
					delete = "d",
					custom = {},
				},
			},
			fzf = {
				select = "default",
				paste = "ctrl-p",
				paste_behind = "ctrl-P",
				custom = {},
			},
		},
	})
end

return config
