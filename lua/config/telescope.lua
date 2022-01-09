---@diagnostic disable: undefined-global
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	find_command = {
		"rg",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
	},
	use_less = true,
	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	extensions = {
		-- arecibo = {
		--     ["selected_engine"] = 'google',
		--     ["url_open_command"] = 'open',
		--     ["show_http_headers"] = false,
		--     ["show_domain_icons"] = false
		-- },
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
			find_cmd = "rg",
		},
		fzf = {
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		project = {
			base_dirs = {
				{ path = "~/.local/git", max_depth = 3 },
			},
			hidden_files = true,
		},
	},
	defaults = {
		pickers = {
			spell_suggest = {
				theme = "cursor",
			},
			lsp_code_actions = {
				theme = "cursor",
			},
			lsp_range_code_actions = {
				theme = "cursor",
			},
			buffers = {
				theme = "dropdown",
			},
			oldfiles = {
				theme = "dropdown",
			},
			git_branches = {
				theme = "dropdown",
			},
			find_files = {
				theme = "dropdown",
				hidden = true,
			},
			git_commits = {
				mappings = {
					i = {
						["<CR>"] = function(prompt_bufnr)
							actions.close(prompt_bufnr)
							local value = actions.get_selected_entry(prompt_bufnr).value
							vim.cmd("DiffviewOpen " .. value .. "~1.." .. value)
						end,
					},
				},
			},
		},
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
		history = {
			path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
			limit = 100,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("gh")
-- telescope.load_extension("node_modules")
telescope.load_extension("session-lens")
telescope.load_extension("vim_bookmarks")
-- telescope.load_extension("ultisnips")
telescope.load_extension("project")
telescope.load_extension("neoclip")
telescope.load_extension("smart_history")
telescope.load_extension("aerial")
-- require('telescope').load_extension('snippets')
-- require('telescope').load_extension('arecibo')
telescope.load_extension("media_files")

local bookmark_actions = telescope.extensions.vim_bookmarks.actions
telescope.extensions.vim_bookmarks.all({
	attach_mappings = function(_, map)
		map("n", "dd", bookmark_actions.delete_selected_or_at_cursor)

		return true
	end,
})
telescope.extensions.vim_bookmarks.current_file({
	attach_mappings = function(_, map)
		map("n", "dd", bookmark_actions.delete_selected_or_at_cursor)

		return true
	end,
})

require("session-lens").setup({
	path_display = { "shorten" },
	theme_conf = { border = false },
	previewer = false,
})

local M = {}

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "$HOME/.config/nvim/",
	})
end

M.switch_projects = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Switch Project >",
		cwd = "$HOME/.local/git/",
	})
end

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(prompt_bufnr, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

return M
