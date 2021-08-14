-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

require('packer').reset()

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

-- Install plugins
require('plugins')
require('config')
require('keymappings')
require('lang')
-- DAP
-- require('dbg')

require('statusline')

vim.cmd([[command! SoInit source ~/.config/nvim/init.lua | PackerCompile]])
vim.cmd([[autocmd BufWritePost plugins.lua SoInit]])
vim.cmd([[autocmd VimEnter * PackerCompile]])
