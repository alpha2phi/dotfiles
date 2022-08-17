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

function M.vim.background_blend(color, strength, hl)
  Bg_color = nil
  status, hl_cfg = pcall(function()
    return vim.api.nvim_get_hl_by_name(hl, true)
  end)
  if hl and status then
    Bg_color = hl_cfg.background or vim.api.nvim_get_hl_by_name("Normal", true).background
  else
    Bg_color = vim.api.nvim_get_hl_by_name("Normal", true).background
  end
  local blend_color = lush.hsl(color)
  local base_color = Bg_color and ("#" .. string.format("%06x", Bg_color)) or my_colors[vim.opt.background:get()]

  return lush.hsl(base_color).mix(blend_color, strength).hex
end

function M.vim.highlight_blend_bg(hl_name, strength, color)
  local old_hl = nil
  local fetch_old_hl = function()
    if color == nil then
      local _old_hl = vim.api.nvim_get_hl_by_name(hl_name, true)
      old_hl = _old_hl and _old_hl.background or "3213215"
    end
  end

  if pcall(fetch_old_hl) or color then
    local hl_guibg = M.vim.background_blend(color or ("#" .. string.format("%06x", old_hl)), strength, "MyNormal")
    vim.api.nvim_set_hl(0, hl_name, { background = hl_guibg, nocombine = false })
  end
end

return M
