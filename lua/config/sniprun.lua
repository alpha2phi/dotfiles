local M = {}

M.setup = function()
	require("sniprun").setup({
		display = {
			"VirtualTextOk",
			"VirtualTextErr",
			"LongTempFloatingWindow",
		},
	})
end

return M
