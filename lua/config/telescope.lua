---@diagnostic disable: undefined-global
local config = {}

function config.setup()
	local trouble = require("trouble.providers.telescope")
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
		-- find_command = {
		-- 	"rg",
		-- 	"--no-heading",
		-- 	"--with-filename",
		-- 	"--line-number",
		-- 	"--column",
		-- 	"--smart-case",
		-- },
		-- use_less = true,
		-- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		-- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		-- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
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
		extensions = {
			-- arecibo = {
			--     ["selected_engine"] = 'google',
			--     ["url_open_command"] = 'open',
			--     ["show_http_headers"] = false,
			--     ["show_domain_icons"] = false
			-- },
			arecibo = {
				["selected_engine"] = "google",
				["url_open_command"] = "open",
				["show_http_headers"] = false,
				["show_domain_icons"] = false,
			},
			frecency = {
				db_root = vim.fn.stdpath("data") .. "/databases/",
				show_scores = false,
				show_unindexed = true,
				ignore_patterns = { "*.git/*", "*/tmp/*" },
				disable_devicons = false,
				workspaces = {
					["conf"] = vim.fn.expand("$HOME") .. "/.config",
					["data"] = vim.fn.expand("$HOME") .. "/.local/share",
					["project"] = vim.fn.expand("$HOME") .. "./.local/git",
					["wiki"] = vim.fn.expand("$HOME") .. "/wiki",
				},
			},
			media_files = {
				filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
				find_cmd = "rg",
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			project = {
				base_dirs = {
					{ path = "~/.config/nvim" },
					{ path = "~/.local/git", max_depth = 3 },
				},
				hidden_files = true,
			},
		},
		defaults = {
			mappings = {
				i = { ["<c-t>"] = trouble.open_with_trouble },
				n = { ["<c-t>"] = trouble.open_with_trouble },
			},
			history = {
				path = vim.fn.stdpath("data") .. "/databases/telescope_history.sqlite3",
				limit = 100,
			},
		},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("gh")
	-- telescope.load_extension("node_modules")
	-- telescope.load_extension("session-lens")
	telescope.load_extension("vim_bookmarks")
	telescope.load_extension("project")
	telescope.load_extension("neoclip")
	telescope.load_extension("smart_history")
	telescope.load_extension("aerial")
	-- require('telescope').load_extension('snippets')
	telescope.load_extension("arecibo")
	telescope.load_extension("media_files")
	telescope.load_extension("frecency")
end

return config
