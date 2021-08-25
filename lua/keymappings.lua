local nest = require("nest")

nest.applyKeymaps({
	{
		options = { expr = true },
		{
			{ "<C-Space>", "compe#complete()" },
			{ "<CR>", "compe#confirm('<CR>')" },
			{
				"<C-",
				{
					{ "e>", "compe#close('<C-e>')" },
					{ "j>", "compe#scroll({ 'delta': +4 })" },
					{ "k>", "compe#scroll({ 'delta': -4 })" },
				},
			},
		},
	},
	{ "<Esc><Esc>", "<cmd>nohl<CR>" },
	{ ";", "<Cmd>Telescope git_files<CR>" },
	{ "<M-left>", "<C-w>7<" },
	{ "<M-right>", "<C-w>7>" },
	{ "<M-up>", "<C-w>7+" },
	{ "<M-down>", "<C-w>7-" },
	{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
	{
		"[",
		{
			{ "b", "<Cmd>BufferLineCyclePrev<CR>" },
			{ "d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" },
			{ "m", "<Cmd>BookmarkPrevious<CR>" },
			{ "t", "<Cmd>FloatermPrev<CR>" },
			{ "w", "<Cmd>tabprevious<CR>" },
			{ "<leader>", "<C-o>" },
		},
	},
	{
		"]",
		{
			{ "b", "<Cmd>BufferLineCycleNext<CR>" },
			{ "d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
			{ "m", "<Cmd>BookmarkNext<CR>" },
			{ "t", "<Cmd>FloatermNext<CR>" },
			{ "w", "<Cmd>tabnext<CR>" },
			{ "<leader>", "<C-i>" },
		},
	},
	{
		"g",
		{
			{ "D", "<Cmd>lua vim.lsp.buf.declaration()<CR>" },
			{ "d", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "i", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
		},
	},
	{ "K", "<Cmd>lua vim.lsp.buf.hover()<CR>" },
	{
		"<leader>",
		{
			{ "<esc>", "<Cmd>set relativenumber!<CR>" },
			{ "<left>", '<Cmd>call WinMove("h")<CR>' },
			{ "<right>", '<Cmd>call WinMove("l")<CR>' },
			{ "<up>", '<Cmd>call WinMove("k")<CR>' },
			{ "<down>", '<Cmd>call WinMove("j")<CR>' },
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
			} },
			{ "D", "<Cmd>DogeGenerate<CR>" },
			{
				"f",
				{
					{ "?", "<Cmd>Telescope Cheatsheet<CR>" },
					{ "/", "<Cmd>TodoTelescope<CR>" },
					{ "b", "<Cmd>Telescope buffers<CR>" },
					{ "c", "<Cmd>Telescope colorscheme<CR>" },
					{ "e", "<Cmd>Telescope file_browser<CR>" },
					{ "f", "<Cmd>Telescope find_files<CR>" },
					{ "g", "<Cmd>Telescope live_grep<CR>" },
					{ "k", "<Cmd>Telescope help_tags<CR>" },
					{ "m*", "<Cmd>Telescope vim_bookmarks all<CR>" },
					{ "m.", "<Cmd>Telescope vim_bookmarks current_file<CR>" },
					{ "n", "<Cmd>Telescope node_modules list" },
					{ "o", "<Cmd>Telescope treesitter<CR>" },
					{ "p", "<Cmd>Telescope projects<CR>" },
					{ "s", "<Cmd>Telescope ultisnips ultisnips<CR>" },
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
									{ "d.", "<Cmd>Telescope lsp_document_diagnostics<CR>" },
									{ "d*", "<Cmd>Telescope lsp_workspace_diagnostics<CR>" },
									{ "gr", "<Cmd>Telescope lsp_references<CR>" },
									{ "gi", "<Cmd>Telescope lsp_implementations<CR>" },
									{ "ga", "<Cmd>Telescope lsp_code_actions<CR>" },
									{ "gd", "<Cmd>Telescope lsp_definitions<CR>" },
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
			{ "G", "<Cmd>Neogit<CR>" },
			{
				"j",
				{
					{ "w", "<Cmd>HopWord<CR>" },
					{ "/", "<Cmd>HopPattern<CR>" },
					{ "1", "<Cmd>HopChar1<CR>" },
					{ "2", "<Cmd>HopChar2<CR>" },
					{ "l", "<Cmd>HopLine<CR>" },
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
					{ "<C-k>", "<Cmd>Lspsaga signature_help<CR>" },
					{ ":", "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
					{ "$", "<cmd>lua vim.lsp.buf.document_symbol()<CR>" },
					{ "a", "<Cmd>Lspsaga code_action<CR>" },
					{ "d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" },
					{ "D", "<Cmd>Lspsaga preview_definition<CR>" },
					{ "f", "<Cmd>Lspsaga lsp_finder<CR>" },
					{ "k", "<Cmd>Lspsaga hover_doc<CR>" },
					{ "r", "<Cmd>Lspsaga rename<CR>" },
					{ "R", "<cmd>lua vim.lsp.buf.references()<CR>" },
					{ "ql", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" },
				},
			},
			{
				"t",
				{
					{ "b", {
						{ "m", "<Cmd>BResizeZoom<CR>" },
					} },
					{ "c", "<Cmd>call ToggleBackgroundLightness()<CR>" },
					{ "C", "<Cmd>TSContextToggle<CR>" },
					{ "d", "<Cmd>TroubleToggle<CR>" },
					{
						"f",
						{
							{ ".", "<Cmd>RangerCurrentFile<CR>" },
							{ "*", "<Cmd>Ranger<CR>" },
						},
					},
					{ "m", "<Cmd>BookmarkToggle<CR>" },
					{
						"q",
						{
							{ "f", "<Cmd>call ToggleQuickFix()<CR>" },
							{ "l", "<Cmd>call ToggleQuickLoc()<CR>" },
						},
					},
					{ "t", "<Cmd>FloatermToggle<CR>" },
					{
						"<leader>",
						{
							{ "c", {
								{ "<3", "<Cmd>CPLoad neon_latte<CR>" },
							} },
							{
								"d",
								{
									{ "*", "<Cmd>TroubleToggle lsp_workspace_diagnostics<CR>" },
									{ ".", "<Cmd>TroubleToggle lsp_document_diagnostics<CR>" },
									{ "r", "<Cmd>TroubleToggle lsp_references<CR>" },
									{ "q", "<Cmd>TroubleToggle quickfix<CR>" },
									{ "l", "<Cmd>TroubleToggle loclist<CR>" },
								},
							},
							{ "t", {
								{ "n", "<Cmd>FloatermNew<CR>" },
							} },
						},
					},
				},
			},
			{ "w", {
				{ "n", "<Cmd>tabnew<CR>" },
				{ "q", "<Cmd>tabclose<CR>" },
			} },
		},
	},
})

nest.applyKeymaps({
	{ mode = "i", {
		{ "jk", ":Esc<CR>" },
	} },
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
