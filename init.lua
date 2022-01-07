---@diagnostic disable:undefined-global
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local packer = require("packer")
local packer_util = require("packer.util")
local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

function _G.qftf(info)
	local items
	local ret = {}
	if info.quickfix == 1 then
		items = vim.fn.getqflist({ id = info.id, items = 0 }).items
	else
		items = vim.fn.getloclist(info.winid, { id = info.id, items = 0 }).items
	end
	local limit = 31
	local fname_fmt1, fname_fmt2 = "%-" .. limit .. "s", "…%." .. (limit - 1) .. "s"
	local valid_fmt = "%s │%5d:%-3d│%s %s"
	for i = info.start_idx, info.end_idx do
		local e = items[i]
		local fname = ""
		local str
		if e.valid == 1 then
			if e.bufnr > 0 then
				fname = fn.bufname(e.bufnr)
				if fname == "" then
					fname = "[No Name]"
				else
					fname = fname:gsub("^" .. vim.env.HOME, "~")
				end
				-- char in fname may occur more than 1 width, ignore this issue in order to keep performance
				if #fname <= limit then
					fname = fname_fmt1:format(fname)
				else
					fname = fname_fmt2:format(fname:sub(1 - limit))
				end
			end
			local lnum = e.lnum > 99999 and -1 or e.lnum
			local col = e.col > 999 and -1 or e.col
			local qtype = e.type == "" and "" or " " .. e.type:sub(1, 1):upper()
			str = valid_fmt:format(fname, lnum, col, qtype, e.text)
		else
			str = e.text
		end
		table.insert(ret, str)
	end
	return ret
end

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
	" au BufWritePost plugins.lua luafile $HOME/.config/nvim/init.lua \| PackerCompile
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
