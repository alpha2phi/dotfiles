local M = {
  floaterm_height=0.9,
  floaterm_width=0.9,
  floaterm_wintype="floating",
  floaterm_winblend=10,
  neoranger_viewmode="miller",
  neoranger_opts="--cmd=\"set show_hidden true\"",
  Powerline_symbols = "fancy",
  grepper = { tools = { "rg", "grep" }, searchreg = 1 },
  python_host_prog = my.fs.path.python2:gsub("%s+", ""),
  python3_host_prog = my.fs.path.python3:gsub("%s+", ""),
}

return M
