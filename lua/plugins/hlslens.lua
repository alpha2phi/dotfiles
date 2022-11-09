local M = {}

function M.setup()
	require("hlslens").setup({
		auto_enable = true,
		enable_incsearch = true,
		calm_down = false,
		nearest_only = false,
		nearest_float_when = "auto",
		float_shadow_blend = 50,
		virt_priority = 100,
		build_position_cb = nil,
		override_lens = nil,
	})

	require("scrollbar.handlers.search").setup()

	vim.cmd([[
    hi default link HlSearchNear IncSearch
    hi default link HlSearchLens WildMenu
    hi default link HlSearchLensNear IncSearch
    hi default link HlSearchFloat IncSearch
  ]])
end

return M
