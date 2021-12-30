---@diagnostic disable: undefined-global
vim.g.aerial = {
	default_direction = "right",
	placement_editor_edge = true,
	link_folds_to_tree = false,
	open_automatic = false,
	close_behavior = "auto",
	close_on_select = true,
	filter_kind = false,
	backends = {
		["_"] = { "lsp", "treesitter" },
	},
	max_width = 50,
}

vim.cmd([[
hi link AerialClass Type
hi link AerialClassIcon Special
hi link AerialFunction Special
hi AerialFunctionIcon guifg=#cb4b16 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi link AerialLine QuickFixLine
]])
