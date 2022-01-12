local config = {}
local saga = require("lspsaga")

function config.setup()
	return saga.setup({
		max_preview_lines = 21,
		finder_action_keys = {
			open = "o",
			vsplit = "s",
			split = "i",
			quit = "q",
			scroll_down = "<C-f>",
			scroll_up = "<C-b>",
		},
	})
end

return config
