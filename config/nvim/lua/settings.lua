local utils = require('utils')

local cmd = vim.cmd
local o = vim.o
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'

o.termguicolors = true

utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard', 'unnamed,unnamedplus')

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Auto format
auto_groups = {}
auto_cmds = {}
auto_cmds[0] = "BufWritePre * undojoin | Neoformat"
auto_groups['auto_fmt'] = auto_cmds
utils.create_augroups(auto_groups)

vim.api.nvim_command([[
augroup auto_spellcheck
    autocmd BufNewFile,BufRead *.md setlocal spell
    autocmd BufNewFile,BufRead *.org setfiletype markdown
    autocmd BufNewFile,BufRead *.org setlocal spell
augroup END
]])

vim.api.nvim_command([[
augroup auto_term
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * startinsert
augroup END
]])
