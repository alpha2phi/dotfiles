---@diagnostic disable: undefined-global
vim.g.aerial = {
	default_direction = "right",
	placement_editor_edge = false,
	link_folds_to_tree = false,
	open_automatic = false,
	close_behavior = "auto",
	filter_kind = false,
	backends = {
		["_"] = { "lsp", "treesitter" },
	},
}
