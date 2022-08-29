---@diagnostic disable:undefined-global
_G.my = {
  platform = {
    is_mac = jit.os == "OSX",
    is_linux = jit.os == "Linux",
    is_windows = jit.os == "Windows",
  },
  fs = require 'utils.fs',
  ui = require 'utils.ui',
  io = require 'utils.io',
  git = require 'utils.git',
  struc = require 'utils.table',
  color = require 'utils.color',
  fn = {},
}

function _G.my.fn.onColorscheme()
  local mode_color = my.color.my.vimode[vim.fn.mode()]

  my.fn.toggle_bg_mode(true)

  my.color.fn.highlight_blend_bg("CursorLine", 50, mode_color)
  my.color.fn.highlight_blend_bg("CursorColumn", 50, mode_color)
  my.color.fn.highlight_blend_bg("Visual", 21, mode_color)
  my.color.fn.highlight_blend_bg("TSCurrentScope", 12, mode_color)
end

function _G.my.fn.onModeChanged()
  local mode_color = my.color.my.vimode[vim.fn.mode()]

  vim.api.nvim_set_hl(0, "ScrollbarHandle", { bg = mode_color })

  if vim.opt.background:get() == "light" then
    my.color.fn.highlight_blend_bg("Normal", 21, mode_color)
  else
    my.color.fn.highlight_blend_bg("Normal", 15, mode_color)
  end

  my.color.fn.highlight_blend_bg("CursorLine", 50, mode_color)
  my.color.fn.highlight_blend_bg("CursorColumn", 50, mode_color)
  my.color.fn.highlight_blend_bg("Visual", 21, mode_color)
  my.color.fn.highlight_blend_bg("TSCurrentScope", 12, mode_color)

  require("config/bufferline").setup()
  if not (require("heirline").statusline == nil) then
    require("config.heirline").update()
  end
end

function _G.my.fn.toggle_bg_mode(force)
  local current = vim.opt.background:get()
  local other = current == "light" and "dark" or "light"
  local future = force and current or other

  vim.cmd("set background=" .. future)

  local hl_normal = vim.api.nvim_get_hl_by_name("Normal", true)
  local hl_normal_nc = vim.api.nvim_get_hl_by_name("NormalNC", true)
  hl_normal = hl_normal and hl_normal.background or false
  hl_normal_nc = hl_normal_nc and hl_normal_nc.background or false

  if hl_normal ~= false then
    vim.api.nvim_set_hl(0, "MyNormal", { bg = hl_normal, nocombine = false })
  end
  if hl_normal_nc ~= false or hl_normal ~= false then
    vim.api.nvim_set_hl(0, "NormalNC", { bg = hl_normal_nc or hl_normal, nocombine = false })
  end
  -- my.color.fn.highlight_blend_bg("Normal", 21, my.color.my.vimode[vim.opt.background:get()], "Normal")

  if future == "light" then
    my.color.fn.highlight_blend_bg("Normal", 21, my.color.my.vimode[vim.fn.mode()])
  else
    my.color.fn.highlight_blend_bg("Normal", 15, my.color.my.vimode[vim.fn.mode()])
  end

  for defColor, gitSignsHl in pairs({ [my.color.my.green] = "GitSignsAdd", [my.color.my.orange] = "GitSignsChange",
    [my.color.my.red] = "GitSignsDelete" }) do

    my.color.fn.highlight_blend_bg(gitSignsHl, 50, defColor)
    my.color.fn.highlight_blend_bg(gitSignsHl .. "Nr", 21, defColor)
    my.color.fn.highlight_blend_bg(gitSignsHl .. "Ln", 10, defColor)
  end

  require("config/bufferline").setup()
  if not (require("heirline").statusline == nil) then
    require("config.heirline").update()
  end
end
