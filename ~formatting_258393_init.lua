---@diagnostic disable:undefined-global
-- Map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local fn = vim.fn
local execute = vim.api.nvim_command

local _G = require("global")
local packer = require("packer")
local putil = require("packer.util")

-- Sensible defaults
require("settings")

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end
packer.init({
	compile_path = putil.join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.lua"),
	git = {
		clone_timeout = false,
	},
	display = {
		open_fn = putil.float,
	},
	max_jobs = 16,
	opt_default = false,
})

-- Install plugins
require("plugins")
require("config")

-- execute("PackerCompile")
vim.cmd([[autocmd VimEnter * call wilder#setup()]])

-- LSP
require("lang")

-- DAP
-- require("dbg")

require("statusline")

require("keymappings")

vim.o.qftf = "{info -> v:lua.qftf(info)}"

vim.cmd([[autocmd BufWritePost plugins.lua luafile $HOME/.config/nvim/init.lua]])

vim.cmd([[
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

au VimLeavePre * exec "BookmarkSave $HOME/.config/nvim/bookmarks"
]])
