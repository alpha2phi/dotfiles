local M = {
  fn = {},
  int_to_hex = function(color) return ("#" .. string.format("%06x", Bg_color)) end,
  hex_to_rgb = function(...) return require("lush.vivid.rgb.convert").hex_to_rgb(...) end,
  rgb_to_hex = function(...) return require("lush.vivid.rgb.convert").rgb_to_hex(...) end,
  hsl = function(color) return require("lush").hsl(color) end,
  hsluv = function(color) return require("lush").hsluv(color) end,
  my = {
    red = "#FF0080",
    green = "#00FF80",
    yellow = "#FFDF00",
    blue = "#0000FF",
    purple = "#A000FF",
    aqua = "#00DFFF",
    orange = "#FFAF00",
    magenta = "#F634B1",
    dark = "#100710",
    light = "#F0FFFD",
  },
}
M.my.vimode = {
  c = M.my.purple,
  ce = M.my.purple,
  cv = M.my.purple,
  i = M.my.green,
  ic = M.my.green,
  n = M.my.aqua,
  no = M.my.aqua,
  r = M.my.blue,
  rm = M.my.blue,
  R = M.my.red,
  Rv = M.my.red,
  s = M.my.magenta,
  S = M.my.magenta,
  t = M.my.red,
  V = M.my.yellow,
  v = M.my.yellow,
  ["r?"] = M.my.red,
  [""] = M.my.magenta,
  [""] = M.my.yellow,
  ["!"] = M.my.purple,
}

function M.fn.background_blend(color, strength, hl)
  Bg_color = nil
  local status, hl_cfg = pcall(function()
    return vim.api.nvim_get_hl_by_name(hl, true)
  end)
  if hl and status then
    Bg_color = hl_cfg.background or vim.api.nvim_get_hl_by_name("NormalNC", true).background
  else
    Bg_color = vim.api.nvim_get_hl_by_name("Normal", true).background
  end
  local blend_color = M.hsl(color)
  local base_color = Bg_color and M.int_to_hex(Bg_color) or my.color.my[vim.opt.background:get()]

  return M.hsl(base_color).mix(blend_color, strength).hex
end

function M.fn.highlight_blend_bg(hl_name, strength, color, base_hl)
  base_hl = base_hl or "MyNormal"
  local old_hl = nil
  local fetch_old_hl = function()
    if color == nil then
      local _old_hl = vim.api.nvim_get_hl_by_name(base_hl, true)
      local target_old_hl = vim.api.nvim_get_hl_by_name(hl_name, true)
      old_hl = _old_hl and _old_hl.background or
          (target_old_hl and target_old_hl.background)
    end
  end

  if pcall(fetch_old_hl) or color then
    local hl_guibg = M.fn.background_blend(
      color or
      (old_hl and M.int_to_hex(old_hl)) or
      my.color.my[vim.opt.background:get()],
      strength,
      "MyNormal"
    )
    vim.api.nvim_set_hl(0, hl_name, { background = hl_guibg, nocombine = false })
  end
end

return M
