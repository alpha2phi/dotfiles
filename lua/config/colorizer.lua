local config = {}

function config.setup()
	require("colorizer").setup({
		"*", -- Highlight all files, but customize some others.
		javascript = { css = true },
		html = { css = true },
		css = { css = true },
	})
end

return config
