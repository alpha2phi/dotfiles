local config = {}

function config.setup()
	require("lspkind").init({
		-- enables text annotations
		--
		-- default: true
		with_text = true,

		-- defines how annotations are shown
		-- default: symbol
		-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
		mode = "symbol_text",

		-- default symbol map
		-- can be either 'default' or
		-- 'codicons' for codicon preset (requires vscode-codicons font installed)
		--
		-- default: 'default'
		preset = "codicons",

		-- override preset symbols
		--
		-- default: {}
		symbol_map = {
			Text = "",
			Method = "ƒ",
			Function = "",
			Constructor = "",
			Variable = "",
			Class = "",
			Interface = "ﰮ",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "了",
			Keyword = "",
			Snippet = "﬌",
			Color = "",
			File = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
		},
	})
end

return config
