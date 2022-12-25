local M = {}

function M.onAfterBoot()
  M.applyWinSeparatorNCHighlight()
end

function M.onColorscheme()
  local mode_color = my.color.my.vimode[vim.fn.mode()]
  local ok, tint = pcall(require, "tint")
  local lines = require("heirline")
  local heirline = require("plugins.heirline")

  my.fn.toggle_bg_mode(true)

  my.color.fn.highlight_blend_bg("CursorLine", 50, mode_color)
  my.color.fn.highlight_blend_bg("CursorColumn", 50, mode_color)
  my.color.fn.highlight_blend_bg("Visual", 21, mode_color)
  my.color.fn.highlight_blend_bg("TSCurrentScope", 12, mode_color)
  my.color.fn.highlight_blend_bg("TreesitterContext", 50, mode_color)

  if ok then
    tint.refresh()

    lines.reset_highlights()
    heirline.load_colors()
    heirline.setup(false)
  end
end

function M.onModeChanged()
  local mode_color = my.color.my.vimode[vim.fn.mode()]

  vim.api.nvim_set_hl(0, "ScrollbarHandle", { bg = mode_color })
  vim.api.nvim_set_hl(0, "TreesitterContextBottom",
    { underline = true, underdouble = true, fg = my.color.my.magenta, sp = my.color.my.magenta })

  -- if vim.opt.background:get() == "light" then
  --   my.color.fn.highlight_blend_bg("Normal", 21, mode_color)
  -- else
  --   my.color.fn.highlight_blend_bg("Normal", 15, mode_color)
  -- end

  my.color.fn.highlight_blend_bg("CursorLine", 50, mode_color)
  my.color.fn.highlight_blend_bg("CursorColumn", 50, mode_color)
  my.color.fn.highlight_blend_bg("Visual", 37, mode_color)
  my.color.fn.highlight_blend_bg("TSCurrentScope", 21, mode_color)
  my.color.fn.highlight_blend_bg("TreesitterContext", 50, mode_color)

  require("plugins/bufferline").setup()
  if not (require("heirline").statusline == nil) then
    require("plugins/heirline").setup(false)
  end
end

function M.toggle_bg_mode(force)
  local current = vim.opt.background:get()
  local other = current == "light" and "dark" or "light"
  local future = force and current or other

  vim.cmd("set background=" .. future)

  -- local hl_normal = vim.api.nvim_get_hl_by_name("Normal", true)
  -- local hl_normal_nc = vim.api.nvim_get_hl_by_name("NormalNC", true)
  -- hl_normal = hl_normal and hl_normal.background or false
  -- hl_normal_nc = hl_normal_nc and hl_normal_nc.background or false

  -- if hl_normal ~= false then
  --   vim.api.nvim_set_hl(0, "MyNormal", { bg = hl_normal, nocombine = false })
  -- end
  -- if hl_normal_nc ~= false or hl_normal ~= false then
  --   vim.api.nvim_set_hl(0, "NormalNC", { bg = hl_normal_nc or hl_normal, nocombine = false })
  -- end
  -- -- my.color.fn.highlight_blend_bg("Normal", 21, my.color.my.vimode[vim.opt.background:get()], "Normal")

  -- if future == "light" then
  --   my.color.fn.highlight_blend_bg("Normal", 21, my.color.my.vimode[vim.fn.mode()])
  -- else
  --   my.color.fn.highlight_blend_bg("Normal", 15, my.color.my.vimode[vim.fn.mode()])
  -- end

  for defColor, gitSignsHl in pairs({ [my.color.my.green] = "GitSignsAdd", [my.color.my.orange] = "GitSignsChange",
    [my.color.my.red] = "GitSignsDelete" }) do

    my.color.fn.highlight_blend_bg(gitSignsHl, 90, defColor)
    my.color.fn.highlight_blend_bg(gitSignsHl .. "Nr", 73, defColor)
    my.color.fn.highlight_blend_bg(gitSignsHl .. "Ln", 50, defColor)
  end

  require("plugins/bufferline").setup()
  if not (require("heirline").statusline == nil) then
    require("plugins/heirline").update()
  end
end

function M.applyWinSeparatorNCHighlight()
  local ns_winsep = vim.api.nvim_create_namespace("CurrentBuffer")
  vim.api.nvim_set_hl_ns(ns_winsep)
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = my.color.my.aqua, bg = "bg", nocombine = false })
end

function M.activate_current_win_sep()
  local ns_winsep = vim.api.nvim_create_namespace("CurrentBuffer")
  vim.api.nvim_set_hl(ns_winsep, "WinSeparator", { fg = my.color.my.aqua, bg = my.color.my.magenta })
end

function M.clear_current_win_sep()
  local ns_winsep = vim.api.nvim_create_namespace("CurrentBuffer")
  vim.api.nvim_buf_clear_namespace(0, ns_winsep, 0, -1) -- not working, why?
end

return M
