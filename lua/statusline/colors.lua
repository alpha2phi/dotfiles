---@diagnostic disable: undefined-global
M = {}

M.dark = {
  bg = "#282c34",
  bg2 = "#212026",
  base = "#b2b2b2",
  comp = "#c56ec3",
  func = "#bc6ec5",
  act1 = "#222226",
  DarkGoldenrod2 = "#ffff00", -- normal / unmodified
  chartreuse3 = "#66cd00", --insert
  SkyBlue2 = "#7ec0ee", -- modified
  chocolate = "#d2691e", -- replace
  gray = "#bebebe", -- visual
  plum3 = "#cd96cd", -- read-only / motion
  yellow = "#fabd2f",
  cyan = "#00AFFF",
  darkblue = "#081633",
  green = "#afd700",
  orange = "#FF8800",
  purple = "#771060", --act2
  magenta = "#f634b1",
  grey = "#c0c0c0",
  blue = "#0087d7",
  red = "#ec5f67",
  comments = "#2aa1ae",
  head1 = "#4f97d7",
  error = "#FC5C94",
  warning = "#F3EA98",
  info = "#8DE6F7",
}

M.light = {
  bg = "#fbf8ef",
  bg2 = "#efeae9",
  base = "#655370",
  comp = "#6c4173",
  act1 = "#e7e5eb",
  func = "#6c3163",
  DarkGoldenrod2 = "#ffff00", -- normal / unmodified
  chartreuse3 = "#66cd00", --insert
  SkyBlue2 = "#7ec0ee", -- modified
  chocolate = "#d2691e", -- replace
  gray = "#bebebe", -- visual
  plum3 = "#cd96cd", -- read-only / motion
  yellow = "#fabd11",
  cyan = "#00afff",
  darkblue = "#081633",
  green = "#afd700",
  orange = "#FF8800",
  purple = "#771060", --act2
  magenta = "#f634b1",
  grey = "#c0c0c0",
  blue = "#0087d7",
  red = "#ec5f67",
  comments = "#2aa1ae",
  head1 = "#3a81c3",
  error = "#FC5C94",
  warning = "#F3EA98",
  info = "#8DE6F7",
}

function M.color(val)
  if vim.opt.background:get() == "light" then
    return M.light[val]
  else
    return M.dark[val]
  end
end

function M.Color(val)
  return function()
    local mode_color = {
      c = "plum3",
      ce = "plum3",
      cv = "plum3",
      i = "chartreuse3",
      ic = "chartreuse3",
      n = "DarkGoldenrod2",
      no = "DarkGoldenrod2",
      r = "chocolate",
      rm = "chocolate",
      R = "purple",
      Rv = "purple",
      s = "SkyBlue2",
      S = "SkyBlue2",
      t = "gray",
      V = "gray",
      v = "gray",
      ["r?"] = "chocolate",
      [""] = "SkyBlue2",
      [""] = "gray",
      ["!"] = "plum3",
    }

    local m_color = "error"
    if mode_color[vim.fn.mode()] ~= nil then
      m_color = mode_color[vim.fn.mode()]
    end

    M.light.vimode = m_color
    M.dark.vimode = m_color

    if vim.o.background ~= nil and vim.o.background == "light" then
      if M.light[val] ~= nil then
        return M.light[val]
      else
        return M.light.error
      end
    elseif vim.o.background ~= nil and vim.o.background == "dark" then
      if M.dark[val] ~= nil then
        return M.dark[val]
      else
        return M.dark.error
      end
    end
  end
end

return M
