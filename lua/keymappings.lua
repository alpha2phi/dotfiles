---@diagnostic disable:undefined-global
local nest = require("nest")
local preview = require("goto-preview")
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
	{
		"[",
		{
			{ "b", "<Cmd>BufferLineCyclePrev<CR>" },
			{ "d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" },
			{ "e", "<Plug>(ultest-prev-fail)" },
			{ "q", "<Cmd>cprev<CR>" },
			{ "t", "<Cmd>FloatermPrev<CR>" },
			{ "w", "<Cmd>tabprevious<CR>" },
			{ ".", "<C-o>" },
			{ "M", "<Cmd>BookmarkPrev<CR>" },
		},
	},
	{
		"]",
		{
			{ "b", "<Cmd>BufferLineCycleNext<CR>" },
			{ "d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
			{ "e", "<Plug>(ultest-next-fail)" },
			{ "q", "<Cmd>cnext<CR>" },
			{ "t", "<Cmd>FloatermNext<CR>" },
			{ "w", "<Cmd>tabnext<CR>" },
			{ ".", "<C-i>" },
			{ "m", "<Cmd>BookmarkNext<CR>" },
		},
	},
	{ "*", "*<cmd>lua require('hlslens').start()<CR>" },
	{ "#", "#<cmd>lua require('hlslens').start()<CR>" },
	{
		"g",
		{
			{ "*", "g*<cmd>lua require('hlslens').start()<CR>" },
			{ "#", "g#<cmd>lua require('hlslens').start()<CR>" },
			{ "$", "<Cmd>Telescope treesitter<CR>" },
			{ "d", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "D", "<Cmd>lua vim.lsp.buf.declaration()<CR>" },
			-- { "i", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
			{ "I*", "<cmd>TSLspImportAll<CR>" },
			{ "I.", "<cmd>TSLspImportCurrent<CR>" },
			{ "j", "<C-i>" },
			{ "k", "<C-o>" },
			{ "l", "<Cmd>Trouble lsp_references<CR>" },
			{ "o", "<cmd>Lspsaga show_line_diagnostics<cr>" },
			{ "O", "<cmd>TSLspOrganize<cr>" },
			{ "r", "<cmd>Lspsaga rename<cr>" },
			{ "R", "<cmd>TSLspRenameFile<CR>" },
			{ "x", "<cmd>CodeActionMenu<CR>" },
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
					{ "s", "<Cmd>RestoreSession<CR>" },
					{ "m", "<Cmd>LoadBookmarks<CR>" },
				},
			},
			{
				">",
				{
					{ "s", "<Cmd>SaveSession<CR>" },
					{ "m", "<Cmd>SaveBookmarks<CR>" },
				},
			},
			{ "b", {
				{ "q", ":bp|bd #<CR>" },
				{ "p", "<Cmd>BufferLinePick<CR>" },
			} },
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
					{ "?", "<Cmd>Telescope Cheatsheet<CR>" },
					{ ";", "<Cmd>Telescope git_files<CR>" },
					{ "/", "<Cmd>TodoTelescope<CR>" },
					{ "$", "<Cmd>Telescope aerial<CR>" },
					{ "b", "<Cmd>Telescope buffers<CR>" },
					{ "c", "<Cmd>Telescope colorscheme<CR>" },
					{ "e", "<Cmd>Telescope file_browser<CR>" },
					{ "f", "<Cmd>Telescope find_files<CR>" },
					{ "g", "<Cmd>Telescope live_grep<CR>" },
					{ "i", "<Cmd>Telescope media_files<CR>" },
					{ "k", "<Cmd>Telescope help_tags<CR>" },
					{ "m*", "<Cmd>Telescope vim_bookmarks all<CR>" },
					{ "m.", "<Cmd>Telescope vim_bookmarks current_file<CR>" },
					{ "n", "<Cmd>Telescope node_modules list" },
					{ "p", ":lua require'telescope'.extensions.project.project{}<CR>" },
					{ "s", "<Cmd>Telescope ultisnips ultisnips<CR>" },
					{ "S", "<Cmd>SearchSession<CR>" },
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
				"l",
				{
					{ ":", "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
					{ "$", "<cmd>lua vim.lsp.buf.document_symbol()<CR>" },
					{ "a", "<Cmd>Lspsaga code_action<CR>" },
					{ "d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" },
					{ "D", "<Cmd>Lspsaga preview_definition<CR>" },
					{ "f", "<Cmd>Lspsaga lsp_finder<CR>" },
					{ "F", vim.lsp.buf.formatting },
					{ "k", "<Cmd>Lspsaga signature_help<CR>" },
					{ "r", "<Cmd>Lspsaga rename<CR>" },
					{ "R", "<cmd>lua vim.lsp.buf.references()<CR>" },
					{ "ql", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" },
				},
			},
			{
				"p",
				{
					{ "d", PeekDefinition },
					{ "i", PeekImplementation },
					{ "r", preview.goto_preview_references },
					{ "D", PeekDeclaration },
				},
			},
			{
				"q",
				{
					{ "mm", "<cmd>BookmarkShowAll<CR>" },
					{ "m0", "<cmd>BookmarksList 0<CR>" },
					{ "m1", "<cmd>BookmarksList 1<CR>" },
					{ "m2", "<cmd>BookmarksList 2<CR>" },
					{ "m3", "<cmd>BookmarksList 3<CR>" },
					{ "m4", "<cmd>BookmarksList 4<CR>" },
					{ "m5", "<cmd>BookmarksList 5<CR>" },
					{ "m6", "<cmd>BookmarksList 6<CR>" },
					{ "m7", "<cmd>BookmarksList 7<CR>" },
					{ "m8", "<cmd>BookmarksList 8<CR>" },
					{ "m9", "<cmd>BookmarksList 9<CR>" },
				},
			},
			{ "Q", "<cmd>FloatermKill<CR>:wqa<CR>" },
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
						},
					},
					{ "c", "<Cmd>call ToggleBackgroundLightness()<CR>" },
					{ "C", "<Cmd>TSContextToggle<CR>" },
					{ "d", "<Cmd>TroubleToggle<CR>" },
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
					{ "m", "<Cmd>BookmarkToggle<CR>" },
					{ "o", "<Cmd>AerialToggle right<CR>" },
					{
						"q",
						{
							{ "f", "<Cmd>call ToggleQuickFix()<CR>" },
							{ "l", "<Cmd>call ToggleQuickLoc()<CR>" },
						},
					},
					{ "t", "<Cmd>FloatermToggle<CR>" },
					{ "R", "<Cmd>ProjectRoot<CR>" },
					{ "Z", "<Cmd>ZenMode<CR>" },
					{
						"<leader>",
						{
							{
								"d",
								{
									{ "*", "<Cmd>Trouble lsp_workspace_diagnostics<CR>" },
									{ ".", "<Cmd>Trouble lsp_document_diagnostics<CR>" },
									{ "r", "<Cmd>Trouble lsp_refences<CR>" },
									{ "q", "<Cmd>Trouble quickfix<CR>" },
									{ "l", "<Cmd>Trouble loclist<CR>" },
								},
							},
							{ "t", {
								{ "n", "<Cmd>FloatermNew<CR>" },
							} },
						},
					},
				},
			},
			{
				"w",
				{
					{ "e", "<Plug>(ultest-summary-jump)" },
					{ "n", "<Cmd>tabnew<CR>" },
					{ "q", "<Cmd>tabclose<CR>" },
					{ "o", "<Cmd>lua require('aerial').focus()<CR>" },
				},
			},
		},
	},
})

nest.applyKeymaps({
	{
		mode = "i",
		{
			{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
			{ "<C-K>", "<cmd>Lspsaga hover_doc<cr>" },
			{ "<Del>", '<cmd>lua require("notify").dismiss()<cr>' },
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
				"<leader>",
				{
					{ "l", {
						{ "a", ":<C-U>Lspsaga range_code_action<CR>" },
					} },
				},
			},
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
