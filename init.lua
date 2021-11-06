---@diagnostic disable: undefined-global

-- Map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require("settings")

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
else
	require("packer").reset()
end

-- Install plugins
require("plugins")
require("config")

execute("PackerCompile")
vim.cmd([[autocmd VimEnter * call wilder#setup()]])

require("keymappings")
require("lang")
-- DAP
require("dbg")

require("statusline")

vim.cmd([[autocmd BufWritePost plugins.lua luafile ~/.config/nvim/init.lua]])

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

if v:vim_did_enter
    silent exec "BookmarkLoad ~/.config/nvim/bookmarks"
else
    au VimEnter * silent exec "BookmarkLoad ~/.config/nvim/bookmarks"
endif

au VimLeavePre * exec "normal \<Plug>BookmarkSave ~/.config/nvim/bookmarks"
]])
