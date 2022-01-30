local vim = vim
local ugit = require("utils.git")
local i = require("statusline.icons")
local u = require("statusline.utils")
local diagnostic = require("statusline.providers.diagnostic")
local M = {}

-- get diff datas
-- support plugins: vim-gitgutter vim-signify coc-git
local function get_hunks_data()
	-- diff data 1:add 2:modified 3:remove
	local diff_data = { 0, 0, 0 }
	if vim.fn.exists("b:gitsigns_status_dict") == 1 then
		local gitsigns_dict = vim.api.nvim_buf_get_var(0, "gitsigns_status")
		diff_data[1] = tonumber(gitsigns_dict:match("+(%d+)")) or 0
		diff_data[2] = tonumber(gitsigns_dict:match("~(%d+)")) or 0
		diff_data[3] = tonumber(gitsigns_dict:match("-(%d+)")) or 0
		return diff_data
	elseif vim.fn.exists("*sy#repo#get_stats") == 1 then
		diff_data[1] = vim.fn["sy#repo#get_stats"]()[1]
		diff_data[2] = vim.fn["sy#repo#get_stats"]()[2]
		diff_data[3] = vim.fn["sy#repo#get_stats"]()[3]
		return diff_data
	elseif vim.fn.exists("*GitGutterGetHunkSummary") == 1 then
		for idx, v in pairs(vim.fn.GitGutterGetHunkSummary()) do
			diff_data[idx] = v
		end
	end
	return diff_data
end

function M.diff_add()
	local add = get_hunks_data()[1]
	if add > 0 then
		return add .. " "
	end
end

function M.diff_modified()
	local modified = get_hunks_data()[2]
	if modified > 0 then
		return modified .. " "
	end
end

function M.diff_remove()
	local removed = get_hunks_data()[3]
	if removed > 0 then
		return removed .. " "
	end
end

function M.get_git_branch_formatted()
	if diagnostic.has_diagnostics() then
		u.GalaxyBG("GitBranch", "purple")
	else
		u.GalaxyBG("GitBranch", "act1")
	end
	return ugit.get_branch()
end

function M.seperatorLeft()
	if diagnostic.has_diagnostics() and not ugit.check_workspace() then
		u.GalaxyHi("GitSeperatorLeft", "act1", "purple")
		return i.slant.Right .. " "
	elseif not diagnostic.has_diagnostics() and ugit.check_workspace() then
		u.GalaxyHi("GitSeperatorLeft", "act1", "purple")
		return i.slant.Right .. " "
	else
		return ""
	end
end

function M.seperatorRight()
	if diagnostic.has_diagnostics() and not ugit.check_workspace() then
		u.GalaxyHi("GitSeperatorRight", "purple", "act1")
		return i.slant.Right
	elseif not diagnostic.has_diagnostics() and ugit.check_workspace() then
		u.GalaxyHi("GitSeperatorRight", "purple", "act1")
		return i.slant.Right
	else
		return ""
	end
end

return M
