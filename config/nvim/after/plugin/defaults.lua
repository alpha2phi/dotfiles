local M = {}

local indent = 2
local g = vim.g
local cmd = vim.cmd
local opt = vim.opt
-- local o = vim.o
-- local wo = vim.wo
-- local bo = vim.bo

function M.setup()
  cmd [[filetype plugin indent on]]
  cmd [[syntax enable]]

  g.mapleader = " "
  g.maplocalleader = ","

  opt.shiftwidth = indent
  opt.tabstop = indent
  opt.softtabstop = indent
  opt.termguicolors = true
  opt.hidden = true
  opt.breakindent = true
  opt.ignorecase = true
  opt.scrolloff = 999
  opt.sidescrolloff = 999
  opt.splitbelow = true
  opt.splitright = true
  opt.clipboard = "unnamed,unnamedplus"
  opt.timeoutlen = 300
  opt.updatetime = 300
  opt.inccommand = "split"
  opt.cmdheight = 1
  opt.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
  opt.history = 100
  opt.lazyredraw = true
  opt.synmaxcol = 240
  opt.mouse = "a"
  opt.number = true
  opt.relativenumber = true
  opt.scrolloff = 999
  opt.sidescrolloff = 999
  opt.cursorline = true
  opt.pumblend = 17

  -- opt.formatoptions:append "cqnj"
  -- opt.formatoptions:remove "ator2"

  opt.formatoptions = opt.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    - "o" -- O and o, don't continue comments
    - "r" -- Don't insert comment after <Enter>
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.
    - "2" -- I'm not in gradeschool anymore

  -- g.virtualedit = "all"
  g.python3_host_prog = "~/miniconda3/bin/python3"
  g.vim_markdown_fenced_languages = { "html", "javascript", "typescript", "css", "python", "lua", "vim" }
end

M.setup()
