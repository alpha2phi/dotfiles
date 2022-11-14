local indent = 2

local M = {
  qftf = "{info -> v:lua.my.ui.qftf(info)}",
  termguicolors = true,
  hidden = true,
  ignorecase = true,
  scrolloff = 7,
  splitbelow = true,
  splitright = true,
  clipboard = "unnamed,unnamedplus",
  timeoutlen = 200,
  updatetime = 300,
  inccommand = "split",
  sessionoptions = "globals,resize,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
  undofile = true,
  foldlevelstart = 1,
  foldcolumn = '1',
  number = true,
  relativenumber = true,
  cursorline = true,
  signcolumn = "auto:3",
  shiftwidth = indent,
  tabstop = indent,
  softtabstop = indent,
  expandtab = true,
  list = true,
}

return M
