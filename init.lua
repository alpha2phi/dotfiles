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

execute 'PackerCompile'
vim.cmd([[autocmd VimEnter * call wilder#setup()]])

require('keymappings')
require('lang')
-- DAP
-- require('dbg')

require('statusline')

vim.cmd([[autocmd BufWritePost plugins.lua "source ~/.config/nvim/init.lua"]])

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
    else
        set background=dark
    endif
endfunction

if v:vim_did_enter
    silent exec "BookmarkLoad ~/.config/nvim/bookmarks"
    s:setup_colors()
else
    au VimEnter * silent exec "BookmarkLoad ~/.config/nvim/bookmarks | call s:setup_colors()"
endif

au VimLeavePre * exec "normal \<Plug>BookmarkSave ~/.config/nvim/bookmarks"
]])

