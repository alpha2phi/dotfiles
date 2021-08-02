-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

require('packer').reset()

vim.cmd([[autocmd BufWritePost plugins.lua luafile ~/.config/nvim/init.lua]])
vim.cmd([[autocmd BufWritePost plugins.lua PackerSync]])

-- Install plugins
require('plugins')
require('config')
require('keymappings')
require('lang')
-- DAP
-- require('dbg')

require('statusline')

vim.cmd([[autocmd VimEnter * WhichKey]])
