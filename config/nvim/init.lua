-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require('defaults')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require("config.settings").setup()

require('plugins')

require("keymappings").setup()

require('config.lsp')

require('config.dap')
