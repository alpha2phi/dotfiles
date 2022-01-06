---@diagnostic disable:undefined-global
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local packer = require("packer")
local packer_util = require("packer.util")
local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

require("settings")

-- Auto install packer.nvim if not exists
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	Packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		packer_install_path,
	})
end

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
require("config")
require("statusline")

if not Packer_bootstrap == nil then
	require("packer").sync()
end

require("lang")
require("keymappings")

vim.cmd([[
	au BufWritePost plugins.lua luafile $HOME/.config/nvim/init.lua \| PackerCompile
	au VimEnter * call wilder#setup()
	au VimLeavePre * exec BookmarkSave $HOME/.config/nvim/bookmarks

	function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
	endfunction

	function! ToggleQuickLoc()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lopen
    else
        lclose
    endif
	endfunction

	function! ToggleBackgroundLightness()
    if &background ==# 'dark'
        set background=light
        lua require("indent_guides").setup({ even_colors = { fg = "#FC5C94", bg = "#FC5C94" }, odd_colors = { fg = "#333333", bg = "#333333" }, indent_guide_size = 1 })
    else
        set background=dark
				lua require("indent_guides").setup({ even_colors = { fg = "#5d4d7a", bg = "#5d4d7a" }, odd_colors = { fg = "#cdcdcd", bg = "#cdcdcd" }, indent_guide_size = 1 })
    endif
	endfunction
]])
