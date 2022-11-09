---@diagnostic disable: undefined-global

local onedarkpro = require("onedarkpro")
local odp_utils = require("onedarkpro.utils")

onedarkpro.setup({
  colors = {
    bg = my.color.my.dark,
    fg = my.color.my.light,
    red = my.color.my.red,
    orange = my.color.my.orange,
    yellow = my.color.my.yellow,
    green = my.color.my.green,
    cyan = my.color.my.aqua,
    blue = my.color.my.blue,
    purple = my.color.my.purple,
    white = my.color.my.light,
    black = my.color.my.dark,
    gray = odp_utils.lighten(my.color.my.dark, 0.50),
    highlight = my.color.my.yellow,
    cursorline = odp_utils[vim.opt.background:get() == "dark" and "lighten" or "darken"](my.color.my.dark, 0.97),
    comment = odp_utils[vim.opt.background:get() == "dark" and "lighten" or "darken"](my.color.my.dark, 0.80),
    selection = odp_utils[vim.opt.background:get() == "dark" and "lighten" or "darken"](my.color.my.dark, 0.90),
    color_column = odp_utils[vim.opt.background:get() == "dark" and "lighten" or "darken"](my.color.my.dark, 0.98),
    indentline = odp_utils[vim.opt.background:get() == "dark" and "lighten" or "darken"](my.color.my.dark, 0.93),
    menu = odp_utils[vim.opt.background:get() == "dark" and "lighten" or "darken"](my.color.my.dark, 0.95),
    menu_scroll = odp_utils[vim.opt.background:get() == "dark" and "lighten" or "darken"](my.color.my.dark, 0.90),
    menu_scroll_thumb = odp_utils[vim.opt.background:get() == "dark" and "lighten" or "darken"](my.color.my.blue, 0.80),
  },
  -- hlgroups = {
  -- 	TabLineFill = { bg = odp_utils.lighten(my.color.my.cyan, 0.50), fg = my.color.my.dark },
  -- 	TabLine = { bg = odp_utils.lighten(my.color.my.cyan, 0.50), fg = my.color.my.dark },
  -- 	TabLineSel = { bg = odp_utils.lighten(my.color.my.cyan, 0.50), fg = my.color.my.dark },
  -- },
  styles = {
    strings = "NONE", -- Style that is applied to strings
    comments = "italic", -- Style that is applied to comments
    keywords = "bold", -- Style that is applied to keywords
    functions = "italic,bold", -- Style that is applied to functions
    variables = "italic", -- Style that is applied to variables
  },
  options = {
    bold = true, -- Use the themes opinionated bold styles?
    italic = true, -- Use the themes opinionated italic styles?
    underline = true, -- Use the themes opinionated underline styles?
    undercurl = true, -- Use the themes opinionated undercurl styles?
    cursorline = true,
    transparency = false, -- Use a transparent background?
    terminal_colors = true,
    window_unfocused_color = true,
  },
})
