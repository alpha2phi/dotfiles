---@diagnostic disable:undefined-global
local nest = require("nest")
-- local calltree = require("litee.calltree")

nest.applyKeymaps({
	{ "<Del>", '<cmd>lua require("notify").dismiss()<cr>' },
	{ "<Esc><Esc>", "<cmd>nohl<CR>" },
	{ "<CR><CR>", "<Cmd>BResizeZoom<CR>" },
	{ "<A-h>", "<C-w>7<" },
	{ "<A-l>", "<C-w>7>" },
	{ "<A-j>", "<C-w>7-" },
	{ "<A-k>", "<C-w>7+" },
	{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
	{ "<C-p", '<cmd>"0p<CR>' },
	{ "<C-P", '<cmd>"0P<CR>' },
	{
		"[",
		{
			{ "b", "<Cmd>BufferLineCyclePrev<CR>" },
			{ "B", "<Cmd>bprevious<CR>" },
			{ "d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" },
			{ "e", "<Plug>(ultest-prev-fail)" },
			{ "l", {
				{ "l", "<Cmd>lprev<CR>" },
				{ "q", "<Cmd>cprev<CR>" },
			} },
			{
				"m",
				{
					{ "$", "<Plug>(Marks-prev)" },
					{ "0", "<Plug>(Marks-prev-bookmark0)" },
					{ "1", "<Plug>(Marks-prev-bookmark1)" },
					{ "2", "<Plug>(Marks-prev-bookmark2)" },
					{ "3", "<Plug>(Marks-prev-bookmark3)" },
					{ "4", "<Plug>(Marks-prev-bookmark4)" },
					{ "5", "<Plug>(Marks-prev-bookmark5)" },
					{ "6", "<Plug>(Marks-prev-bookmark6)" },
					{ "7", "<Plug>(Marks-prev-bookmark7)" },
					{ "8", "<Plug>(Marks-prev-bookmark8)" },
					{ "9", "<Plug>(Marks-prev-bookmark9)" },
				},
			},
			{ "t", "<Cmd>FloatermPrev<CR>" },
			{ "w", "<Cmd>tabprevious<CR>" },
		},
	},
	{
		"]",
		{
			{ "b", "<Cmd>BufferLineCycleNext<CR>" },
			{ "B", "<Cmd>bnext<CR>" },
			{ "d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
			{ "e", "<Plug>(ultest-next-fail)" },
			{ "l", {
				{ "l", "<Cmd>lnext<CR>" },
				{ "q", "<Cmd>cnext<CR>" },
			} },
			{
				"m",
				{
					{ "$", "<Plug>(Marks-next)" },
					{ "0", "<Plug>(Marks-next-bookmark0)" },
					{ "1", "<Plug>(Marks-next-bookmark1)" },
					{ "2", "<Plug>(Marks-next-bookmark2)" },
					{ "3", "<Plug>(Marks-next-bookmark3)" },
					{ "4", "<Plug>(Marks-next-bookmark4)" },
					{ "5", "<Plug>(Marks-next-bookmark5)" },
					{ "6", "<Plug>(Marks-next-bookmark6)" },
					{ "7", "<Plug>(Marks-next-bookmark7)" },
					{ "8", "<Plug>(Marks-next-bookmark8)" },
					{ "9", "<Plug>(Marks-next-bookmark9)" },
				},
			},
			{ "t", "<Cmd>FloatermNext<CR>" },
			{ "w", "<Cmd>tabnext<CR>" },
		},
	},
	{ "*", "*<cmd>lua require('hlslens').start()<CR>" },
	{ "#", "#<cmd>lua require('hlslens').start()<CR>" },
	{
		"g",
		{
			{ "*", "g*<cmd>lua require('hlslens').start()<CR>" },
			{ "#", "g#<cmd>lua require('hlslens').start()<CR>" },
			{
				"$",
				{
					{ "$", "<Cmd>Telescope treesitter<CR>" },
					{ "*", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>" },
					{ ".", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>" },
					{ "r", "<cmd>Lspsaga rename<cr>" },
				},
			},
			{ "a", "<cmd>Lspsaga codeAction<CR>" },
			{ "d", "<cmd>split<CR><C-w>T<cmd>vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "D", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
			{
				"I",
				{
					{ "*", "<cmd>TSLspImportAll<CR>" },
					{ ".", "<cmd>TSLspImportCurrent<CR>" },
				},
			},
			{ "j", "<C-I>" },
			{ "k", "<C-O>" },
			{ "o", "<cmd>Lspsaga show_line_diagnostics<cr>" },
			{ "O", "<cmd>TSLspOrganize<cr>" },
			{ "r", "<cmd>split<CR><C-w>T<cmd>vsplit<CR><cmd>Telescope lsp_references<CR>" },
			{ "R", "<cmd>Telescope lsp_references<CR>" },
		},
	},
	{ "K", "<cmd>Lspsaga hover_doc<cr>" },
	{ "n", "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>" },
	{ "N", "<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>" },
	-- { "T", calltree.hover_calltree },
	{
		"<leader>",
		{
			{ "<esc>", "<Cmd>set relativenumber!<CR>" },
			{ "<CR>", "<Cmd>ZenMode<CR>" },
			{ "H", '<Cmd>call WinMove("h")<CR>' },
			{ "L", '<Cmd>call WinMove("l")<CR>' },
			{ "K", '<Cmd>call WinMove("k")<CR>' },
			{ "J", '<Cmd>call WinMove("j")<CR>' },
			{ "%", {
				{ "l", ":luafile %<CR>" },
				{ "i", ":luafile ~/.config/nvim/init.lua<CR>" },
			} },
			{
				"<",
				{
					{
						"s",
						{
							{ "*", "<Cmd>RestoreSession<CR>" },
							{
								".",
								':lua vim.api.nvim_command("RestoreSession " .. vim.fn.stdpath("data") .. "/sessions/" .. require("utils").Git.get_branch():gsub("/","__"))<CR>',
							},
						},
					},
				},
			},
			{
				">",
				{
					{
						"s",
						{
							{ "*", "<Cmd>SaveSession<CR>" },
							{
								".",
								':lua vim.api.nvim_command("SaveSession " .. vim.fn.stdpath("data") .. "/sessions/" .. require("utils").Git.get_branch():gsub("/","__"))<CR>',
							},
						},
					},
				},
			},
			{
				"b",
				{
					{ "q", ":bp|bd #<CR>" },
					{ "p", "<Cmd>BufferLinePick<CR>" },
					{
						"d",
						{
							{ "*", "lua require('close_buffers').delete({type = 'nameless'})<CR>" },
							{ ".", "lua require('close_buffers').delete({type = 'this'})<CR>" },
						},
					},
					{
						"w",
						{
							{ "*", ":wa!<CR>" },
							{ ".", ":w!<CR>" },
						},
					},
				},
			},
			{ "D", "<Cmd>DogeGenerate jsdoc<CR>" },
			{
				"e",
				{
					{ "<C-c>", "<Plug>(ultest-stop-file)" },
					{ "*", "<Plug>(ultest-run-file)" },
					{ ".", "<Plug>(ultest-run-nearest)" },
					{ "h", "<Plug>(ultest-run-last)" },
				},
			},
			{
				"f",
				{
					{ "?", "<Cmd>Cheatsheet<CR>" },
					{ ":", "<Cmd>Telescope commands<CR>" },
					{ ";", "<Cmd>Telescope git_files<CR>" },
					{ "/", "<Cmd>TodoTelescope<CR>" },
					{ "$", "<Cmd>Telescope lsp_document_symbols<CR>" },
					{ "'", "<Cmd>Telescope marks<CR>" },
					{ "b", "<Cmd>Telescope buffers<CR>" },
					{ "c", "<Cmd>Telescope colorscheme<CR>" },
					{ "e", "<Cmd>Telescope file_browser<CR>" },
					{ "f", "<Cmd>Telescope find_files<CR>" },
					{ "g", "<Cmd>Telescope live_grep<CR>" },
					{ "h", "<Cmd>Telescope frecency<CR>" },
					{ "i", "<Cmd>Telescope media_files<CR>" },
					{ "j", "<Cmd>Telescope jumplist<CR>" },
					{ "k", "<Cmd>Telescope help_tags<CR>" },
					{ "m*", "<Cmd>Telescope vim_bookmarks all<CR>" },
					{ "m.", "<Cmd>Telescope vim_bookmarks current_file<CR>" },
					{ "n", "<Cmd>Telescope node_modules list<CR>" },
					{ "p", ":lua require'telescope'.extensions.project.project{}<CR>" },
					{ "r", "<Cmd>Telescope lsp_references<CR>" },
					{
						"R",
						{
							{ "<", ":lua require'nvim-redux'.list_actions_in_switch_reducer()<CR>" },
							{ ">", ":lua require'nvim-redux'.list_dispatch_calls()<CR>" },
						},
					},
					{ "s", "<Cmd>SearchSession<CR>" },
					{ "w", "<Cmd>Telescope grep_string<CR>" },
					{ "y", "<Cmd>Telescope neoclip<CR>" },
					{ "z", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
					{
						"<leader>",
						{
							{
								"l",
								{
									{ "$.", "<Cmd>Telescope lsp_document_symbols<CR>" },
									{ "$*", "<Cmd>Telescope lsp_workspace_symbols<CR>" },
									{ "a", "<Cmd>Telescope lsp_code_actions<CR>" },
									{ "d.", "<Cmd>Telescope lsp_document_diagnostics<CR>" },
									{ "d*", "<Cmd>Telescope lsp_workspace_diagnostics<CR>" },
									{ "D", "<Cmd>Telescope lsp_definitions<CR>" },
									{ "i", "<Cmd>Telescope lsp_implementations<CR>" },
									{ "r", "<Cmd>Telescope lsp_references<CR>" },
								},
							},
							{
								"g",
								{
									{ "c.", "<Cmd>Telescope git_bcommits<CR>" },
									{ "c*", "<Cmd>Telescope git_commits<CR>" },
									{ "b", "<Cmd>Telescope git_branches<CR>" },
									{ "?", "<Cmd>Telescope git_status<CR>" },
									{ "s", "<Cmd>Telescope git_stash<CR>" },
									{
										"@",
										{
											{ "i", "<Cmd>Telescope gh issues<CR>" },
											{ "p", "<Cmd>Telescope gh pull_requests<CR>" },
										},
									},
								},
							},
						},
					},
				},
			},
			{
				"g",
				{
					{ "d", "<cmd>DiffviewOpen<CR>" },
					{ "D", "<cmd>DiffviewFileHistory<CR>" },
					{ "R", "<cmd>DiffviewRefresh<CR>" },
					{
						"y",
						{
							".",
							'<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
						},
						{
							"*",
							'<cmd>lua require"gitlinker".get_repo_url()<cr>',
						},
					},
				},
			},
			{ "G", "<Cmd>Neogit<CR>" },
			{
				"j",
				{
					{ "/", "<Cmd>HopPattern<CR>" },
					{ "1", "<Cmd>HopChar1<CR>" },
					{ "2", "<Cmd>HopChar2<CR>" },
					{ "j", "<Cmd>lua require('hop-extensions').hint_references()<CR>" },
					{ "l", "<Cmd>HopLine<CR>" },
					{ "t", "<Cmd>lua require('hop-extensions').hint_scopes()<CR>" },
					{ "w", "<Cmd>HopWord<CR>" },
				},
			},
			{
				"k",
				{
					{ "*", "<Cmd>call Dasht(dasht#cursor_search_terms(), '!')<CR>" },
					{ ".", "<Cmd>call Dasht(dasht#cursor_search_terms())<CR>" },
				},
			},
			{
				"m",
				{
					{ "0", "<Plug>(Marks-set-bookmark0)" },
					{ "1", "<Plug>(Marks-set-bookmark1)" },
					{ "2", "<Plug>(Marks-set-bookmark2)" },
					{ "3", "<Plug>(Marks-set-bookmark3)" },
					{ "4", "<Plug>(Marks-set-bookmark4)" },
					{ "5", "<Plug>(Marks-set-bookmark5)" },
					{ "6", "<Plug>(Marks-set-bookmark6)" },
					{ "7", "<Plug>(Marks-set-bookmark7)" },
					{ "8", "<Plug>(Marks-set-bookmark8)" },
					{ "9", "<Plug>(Marks-set-bookmark9)" },
					{
						"q",
						{
							{ "$", "<Plug>(Marks-delete-bookmark)" },
							{ ".", "<Plug>(Marks-deleteline)" },
							{ "*", "<Plug>(Marks-deletebuf)" },
						},
					},
					{
						"l",
						{
							{ "*", "<cmd>BookmarksListAll<CR>" },
							{ "0", "<cmd>BookmarksList 0<CR>" },
							{ "1", "<cmd>BookmarksList 1<CR>" },
							{ "2", "<cmd>BookmarksList 2<CR>" },
							{ "3", "<cmd>BookmarksList 3<CR>" },
							{ "4", "<cmd>BookmarksList 4<CR>" },
							{ "5", "<cmd>BookmarksList 5<CR>" },
							{ "6", "<cmd>BookmarksList 6<CR>" },
							{ "7", "<cmd>BookmarksList 7<CR>" },
							{ "8", "<cmd>BookmarksList 8<CR>" },
							{ "9", "<cmd>BookmarksList 9<CR>" },
						},
					},
				},
			},
			{
				"q",
				{
					{ "q", "<cmd>FloatermKill<CR>:wqa!<CR>" },
				},
			},
			{
				"s",
				{
					{ ".", "<cmd>ISwapWith<CR>" },
					{ "*", "<cmd>ISwap<CR>" },
				},
			},
			{
				"t",
				{
					{
						"b",
						{
							{ "m", "<Cmd>BResizeZoom<CR>" },
							{ "o", "<Cmd>lua require('aerial').focus()<CR>" },
						},
					},
					{ "c", "<Cmd>lua toggle_bg_mode()<CR>" },
					{ "C", "<Cmd>TSContextToggle<CR>" },
					{
						"d",
						{
							{ "*", "<Cmd>call ToggleDiagFix()<CR>" },
							{ ".", "<Cmd>call ToggleDiagLoc()<CR>" },
						},
					},
					-- { "D", ":lua require('dapui').toggle()" },
					{ "e", "<Plug>(ultest-summary-toggle)" },
					{
						"f",
						{
							{ ".", "<Cmd>RangerCurrentFile<CR>" },
							{ "*", "<Cmd>Ranger<CR>" },
						},
					},
					{ "F", "<Cmd>Twilight<CR>" },
					{
						"l",
						{
							{ "l", "<Cmd>call ToggleQuickLoc()<CR>" },
							{ "q", "<Cmd>call ToggleQuickFix()<CR>" },
						},
					},
					{ "m", "<Plug>(Marks-toggle)" },
					{ "o", "<Cmd>AerialToggle right<CR>" },
					{ "t", "<Cmd>FloatermToggle<CR>" },
					{ "R", "<Cmd>ProjectRoot<CR>" },
					{ "Z", "<Cmd>ZenMode<CR>" },
					{
						"<leader>",
						{
							{ "t", {
								{ "n", "<Cmd>FloatermNew<CR>" },
							} },
						},
					},
				},
			},
			{
				"x",
				{
					{ ".", "<Cmd>SnipRun<CR>" },
					{ ";", "<Cmd>SnipClose<CR>" },
				},
			},
			{
				"w",
				{
					{ "*", "<cmd>wincmd =<cr><cmd>QfResizeWindows<CR>" },
					{ "e", "<Plug>(ultest-summary-jump)" },
					{ "n", "<Cmd>tabnew<CR>" },
					{ "q", "<Cmd>tabclose<CR>" },
				},
			},
		},
	},
})

nest.applyKeymaps({
	{
		mode = "i",
		{
			{ "<f20>", "<C-o>" },
			{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
			{ "<C-K>", "<cmd>Lspsaga hover_doc<cr>" },
			{ "<C-Del>", '<cmd>lua require("notify").dismiss()<cr>' },
		},
	},
})

nest.applyKeymaps({
	{
		mode = "t",
		{
			{
				"[",
				{
					{ "t", "<C-\\><C-n>:FloatermPrev<CR>" },
				},
			},
			{
				"]",
				{
					{ "t", "<C-\\><C-n>:FloatermNext<CR>" },
				},
			},
			{
				"<leader>",
				{
					{
						"t",
						{
							{ "t", "<C-\\><C-n>:FloatermToggle<CR>" },
							{
								"<leader>",
								{
									{ "t", {
										{ "n", "<C-\\><C-n>:FloatermNew<CR>" },
									} },
								},
							},
						},
					},
				},
			},
		},
	},
})

nest.applyKeymaps({
	{
		mode = "v",
		{
			{ "<lt>", "<gv" },
			{ "<gt>", ">gv" },
			{ "J", ":m '>+1<CR>gv=gv" },
			{ "K", ":m '<-2<CR>gv=gv" },
			{
				"g",
				{
					{ "l", {
						{ "a", ":<C-U>Lspsaga range_code_action<CR>" },
					} },
					{ "x", ":'<,'>SnipRun" },
				},
			},
			{ "m", ":lua require('tsht').nodes()<CR>" },
		},
	},
})

nest.applyKeymaps({
	{
		mode = "o",
		{
			{ "is.", "<Plug>(textobj-sandwich-query-i)" },
			{ "is*", "<Plug>(textobj-sandwich-auto-i)" },
			{ "is$", "<Plug>(textobj-sandwich-literal-query-i)" },
			{ "as.", "<Plug>(textobj-sandwich-query-a)" },
			{ "as*", "<Plug>(textobj-sandwich-auto-a)" },
			{ "as$", "<Plug>(textobj-sandwich-literal-query-a)" },
			{ "m", ":<C-U>lua require('tsht').nodes()<CR>" },
		},
	},
})

nest.applyKeymaps({
	{
		mode = "x",
		{
			{ "is.", "<Plug>(textobj-sandwich-query-i)" },
			{ "is*", "<Plug>(textobj-sandwich-auto-i)" },
			{ "is$", "<Plug>(textobj-sandwich-literal-query-i)" },
			{ "as.", "<Plug>(textobj-sandwich-query-a)" },
			{ "as*", "<Plug>(textobj-sandwich-auto-a)" },
			{ "as$", "<Plug>(textobj-sandwich-literal-query-a)" },
		},
	},
})
