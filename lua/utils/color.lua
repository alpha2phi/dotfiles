local lush = require("lush")
local rgbConvert = require("lush.vivid.rgb.convert")

local M = {
	vim = {},
	rgb = {
		from_hex = rgbConvert.hex_to_rgb,
		to_hex = rgbConvert.rgb_to_hex,
	},
	hsl = lush.hsl,
	hsluv = lush.hsluv,
}

function M.vim.background_blend(color, strength)
	local bg_color = vim.api.nvim_get_hl_by_name("Normal", true).background or "3213215"
	local blend_color = lush.hsluv(color)

	return lush.hsluv("#" .. string.format("%06x", bg_color)).mix(blend_color, strength).hex
end

function M.vim.highlight_blend_bg(hl_name, strength, color)
	local old_hl = nil
	local fetch_old_hl = function()
		if color == nil then
			old_hl = vim.api.nvim_get_hl_by_name(hl_name, true).background or "3213215"
		end
	end

	if pcall(fetch_old_hl) or color then
		local hl_guibg = M.vim.background_blend(color or ("#" .. string.format("%06x", old_hl)), strength)
		vim.api.nvim_set_hl(0, hl_name, { background = hl_guibg })
	end
end

return M
