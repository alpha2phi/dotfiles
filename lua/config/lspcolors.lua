local config = {}

function config.setup()
	require("lsp-colors").setup({
		Error = "#db0b0b",
		Warning = "#f97f58",
		Information = "#0db9d7",
		Hint = "#10B981",
	})
end

return config
