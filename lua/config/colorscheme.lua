local utils = require("utils")
local cmd = vim.cmd

utils.opt("o", "termguicolors", true)
-- cmd 'colorscheme onedark'
-- cmd 'colorscheme edge'
cmd("colorscheme neon")
