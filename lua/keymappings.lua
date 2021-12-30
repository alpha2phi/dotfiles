---@diagnostic undefined-global
local fn = require("global")
local nest = require("nest")

nest.applyKeymaps({
	{ "<Esc><Esc>", "<cmd>nohl<CR>" },
	{ ";", "<Cmd>Telescope git_files<CR>" },
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
			{ "m", "<Cmd>BookmarkPrev<CR>" },
			{ "q", "<Cmd>cprev<CR>" },
			{ "t", "<Cmd>FloatermPrev<CR>" },
			{ "w", "<Cmd>tabprevious<CR>" },
			{ ".", "<C-o>" },
		},
	},
	{
		"]",
		{
			{ "b", "<Cmd>BufferLineCycleNext<CR>" },
			{ "d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
			{ "m", "<Cmd>BookmarkNext<CR>" },
			{ "q", "<Cmd>cnext<CR>" },
			{ "t", "<Cmd>FloatermNext<CR>" },
			{ "w", "<Cmd>tabnext<CR>" },
			{ ".", "<C-i>" },
		},
	},
	{
		"g",
		{
			{ "D", "<Cmd>lua vim.lsp.buf.declaration()<CR>" },
			{ "d", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "i", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
			{ "j", "<C-i>" },
			{ "k", "<C-o>" },
			{ "o", "<cmd>Lspsaga show_line_diagnostics<cr>" },
			{ "r", "<cmd>Lspsaga rename<cr>" },
			{ "x", "<cmd>CodeActionMenu<CR>" },
		},
	},
	{ "K", "<cmd>Lspsaga hover_doc<cr>" },
	{
		"<leader>",
		{
			{ "<esc>", "<Cmd>set relativenumber!<CR>" },
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
			{ "D", "<Cmd>DogeGenerate<CR>" },
			{
				"f",
				{
					{ "?", "<Cmd>Telescope Cheatsheet<CR>" },
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
					{ "o", "<Cmd>Telescope treesitter<CR>" },
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
					{ "k", "<Cmd>Lspsaga signature_help<CR>" },
					{ "K", "<Cmd>Lspsaga hover_doc<CR>" },
					{ "r", "<Cmd>Lspsaga rename<CR>" },
					{ "R", "<cmd>lua vim.lsp.buf.references()<CR>" },
					{ "ql", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" },
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
					-- { "d", "<Cmd>TroubleToggle<CR>" },
					{ "D", ":lua require('dapui').toggle()" },
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
							{ "c", {
								{ "<3", "<Cmd>CPLoad neon_latte<CR>" },
							} },
							-- {
							-- 	"d",
							-- 	{
							-- 		{ "*", "<Cmd>TroubleToggle lsp_workspace_diagnostics<CR>" },
							-- 		{ ".", "<Cmd>TroubleToggle lsp_document_diagnostics<CR>" },
							-- 		{ "r", "<Cmd>TroubleToggle lsp_references<CR>" },
							-- 		{ "q", "<Cmd>TroubleToggle quickfix<CR>" },
							-- 		{ "l", "<Cmd>TroubleToggle loclist<CR>" },
							-- 	},
							-- },
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
					{ "n", "<Cmd>tabnew<CR>" },
					{ "q", "<Cmd>tabclose<CR>" },
					{ "o", "<Cmd>lua require('aerial').focus()<CR>" },
				},
			},
		},
	},
})

nest.applyKeymaps({
	{ mode = "i", {
		{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
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
