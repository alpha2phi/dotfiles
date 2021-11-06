local saga = require("lspsaga")

return saga.init_lsp_saga({
	max_preview_lines = 21,
	finder_action_keys = {
		open = "<cr>",
		vsplit = "<right>",
		split = "<down>",
		quit = "q",
		scroll_down = "<A-j>",
		scroll_up = "<A-k>",
	},
})
