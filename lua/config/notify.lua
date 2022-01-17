local config = {}

function config.setup()
	local notify = require("notify")

	notify.setup({
		stages = "fade",
		render = "default",
		timeout = 7000,
		background_colour = function()
			local output = "#F634B1"
			if vim.opt.background:get() == "light" then
				output = "#F737C7"
			else
				output = "#F73090"
			end
			return output
		end,
		minimum_width = 70,
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "✎",
		},
	})
	vim.notify = notify
end

return config
