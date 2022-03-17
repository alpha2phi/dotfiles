---@diagnostic disable:undefined-global
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Auto install packer.nvim if not exists
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	Packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		packer_install_path,
	})
end

if not Packer_bootstrap == nil then
	require("packer").sync()
end

local packer = require("packer")
local packer_util = require("packer.util")

require("global")
require("settings")

packer.reset()
packer.init({
	compile_path = packer_util.join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.lua"),
	git = {
		clone_timeout = false,
	},
	display = {
		open_fn = packer_util.float,
	},
	max_jobs = 16,
	opt_default = false,
})

require("plugins")
require("statusline")

require("lang")
require("keymappings")
require("config/colorschemes")

vim.cmd([[au VimLeavePre * BookmarkSave]] .. vim.fn.stdpath("config") .. [[/bookmarks]])
vim.cmd([[au BufWritePost plugins.lua luafile]] .. vim.fn.stdpath("config") .. [[/init.lua]])
vim.cmd("au BufWritePost plugins.lua PackerCompile")
