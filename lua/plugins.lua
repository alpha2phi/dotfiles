---@diagnostic disable: undefined-global
return require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })
		use({ "LionC/nest.nvim" })

		-- Development
		use({ "tpope/vim-dispatch" })
		use({ "tpope/vim-commentary" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring" })
		use({ "machakann/vim-sandwich" })
		use({ "tpope/vim-unimpaired" })
		use({ "tpope/vim-sleuth" })
		use({ "tpope/vim-repeat" })
		-- use {'guns/vim-sexp'}
		-- use {'tpope/vim-sexp-mappings-for-regular-people'}
		use({ "gelguy/wilder.nvim" })
		use({ "wellle/targets.vim" })
		use({
			"phaazon/hop.nvim",
			as = "hop",
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		})
		use({ "karb94/neoscroll.nvim" })
		use({ "unblevable/quick-scope" })
		use({ "voldikss/vim-floaterm" })
		use({ "windwp/vim-floaterm-repl" })
		-- use({ "jiangmiao/auto-pairs" })
		use({ "windwp/nvim-ts-autotag" })
		use({ "windwp/nvim-autopairs" })
		use({ "norcalli/nvim-colorizer.lua" })
		use({ "lokaltog/neoranger" })
		use({ "diepm/vim-rest-console" })
		use({ "hkupty/iron.nvim" }) --Interactive REPL
		use({ "kosayoda/nvim-lightbulb" })
		-- Color
		use({
			"glepnir/indent-guides.nvim",
			branch = "main",
			config = function()
				if vim.opt.background:get() == "light" then
					require("indent_guides").setup({
						even_colors = { fg = "#FC5C94", bg = "#FC5C94" },
						odd_colors = { fg = "#333333", bg = "#333333" },
						indent_guide_size = 1,
					})
				else
					require("indent_guides").setup({
						even_colors = { fg = "#5d4d7a", bg = "#5d4d7a" },
						odd_colors = { fg = "#cdcdcd", bg = "#cdcdcd" },
						indent_guide_size = 1,
					})
				end
				require("indent_guides").indent_guides_enable()
			end,
		})
		-- a virtual scrollbar with sign support

		use({ "rktjmp/lush.nvim" })
		use({ "savq/melange" })
		-- use({ "adisen99/codeschool.nvim" })
		use({ "joehannes-ux/lush-jsx.nvim" })
		use({ "olimorris/onedarkpro.nvim" })

		-- use({ "navarasu/onedark.nvim" })
		use({ "NLKNguyen/papercolor-theme" })
		use({ "sainnhe/everforest" })
		use({ "tanvirtin/monokai.nvim" })
		use({ "Pocco81/Catppuccino.nvim" })
		use({ "katawful/kat.nvim" })
		use({ "sainnhe/edge" })
		use({ "rafamadriz/neon" })
		-- use({
		-- 	"projekt0n/github-nvim-theme",
		-- 	config = function()
		-- 		require("github-theme").setup()
		-- 	end,
		-- })
		use({ "folke/tokyonight.nvim" })

		-- Testing
		-- use {'vim-test/vim-test'}
		-- use { "rcarriga/vim-ultest", run = ":UpdateRemotePlugins" }

		-- Telescope
		use({ "tami5/sqlite.lua" })
		use({ "nvim-lua/plenary.nvim" })
		-- use {'ludovicchabant/vim-gutentags'}
		use({ "nvim-lua/popup.nvim" })
		use({ "nvim-telescope/telescope.nvim" })
		use({ "fhill2/telescope-ultisnips.nvim" })
		use({ "nvim-telescope/telescope-smart-history.nvim" })
		-- use {
		--     'nvim-telescope/telescope-frecency.nvim',
		--     requires = {'tami5/sql.nvim'},
		--     config = function()
		--         require('telescope').load_extension('frecency')
		--     end
		-- }
		use({ "nvim-telescope/telescope-symbols.nvim" })
		use({ "nvim-telescope/telescope-github.nvim" })
		-- use {
		--     'nvim-telescope/telescope-arecibo.nvim',
		--     rocks = {"openssl", "lua-http-parser"}
		-- }
		-- use { 'nvim-telescope/telescope-media-files.nvim' }
		-- use { 'nvim-telescope/telescope-packer.nvim ' }
		use({ "sudormrfbin/cheatsheet.nvim" })
		use({ "rmagatti/auto-session" })
		use({
			"rmagatti/session-lens",
			requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		})
		use({ "tom-anders/telescope-vim-bookmarks.nvim" })
		use({ "nvim-telescope/telescope-snippets.nvim" })
		use({
			"AckslD/nvim-neoclip.lua",
			requires = { "tami5/sqlite.lua", module = "sqlite" },
			config = function()
				require("neoclip").setup({
					history = 1000,
					enable_persistant_history = true,
					db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
					filter = nil,
					preview = true,
					default_register = '"',
					content_spec_column = false,
					on_paste = {
						set_reg = false,
					},
					keys = {
						i = {
							select = "<cr>",
							paste = "<c-p>",
							paste_behind = "<c-P>",
							custom = {},
						},
						n = {
							select = "<cr>",
							paste = "p",
							paste_behind = "P",
							custom = {},
						},
					},
				})
			end,
		})

		-- Better LSP experience
		-- LSP config
		use({ "neovim/nvim-lspconfig" })
		use({ "kabouzeid/nvim-lspinstall" })
		-- use({ "glepnir/lspsaga.nvim" })
		-- use({ "jasonrhansen/lspsaga.nvim", branch = "finder-preview-fixes" })
		use({ "tami5/lspsaga.nvim" })
		use({ "onsails/lspkind-nvim" })
		use({ "mortepau/codicons.nvim" })
		-- use {'sbdchd/neoformat'}
		use({ "mhartington/formatter.nvim" })
		use({ "p00f/nvim-ts-rainbow" })
		use({ "ray-x/lsp_signature.nvim" })
		use({ "folke/lsp-colors.nvim" })
		-- use {'szw/vim-maximizer'}
		-- use {'dyng/ctrlsf.vim'}
		-- use {'pechorin/any-jump.vim'}
		use({ "kshenoy/vim-signature" })
		use({ "kyazdani42/nvim-web-devicons" })
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup({})
			end,
		})
		use({
			"kevinhwang91/nvim-bqf",
			config = function()
				require("bqf").setup({
					preview = {
						win_height = 12,
						win_vheight = 12,
						delay_syntax = 80,
						border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
					},
					func_map = {
						vsplit = "",
						ptogglemode = "z,",
						stoggleup = "",
					},
					filter = {
						fzf = {
							action_for = { ["ctrl-s"] = "split" },
							extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
						},
					},
				})
			end,
		})
		use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
		-- use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" })
		-- use({ "ray-x/navigator.lua", requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" } })
		-- use({ "junegunn/vim-peekaboo" })
		-- use {'gennaro-tedesco/nvim-peekup'}
		-- use {'wellle/context.vim'}
		-- use {'lukas-reineke/indent-blankline.nvim' }
		-- use {'Yggdroot/indentLine' }
		-- use {'beauwilliams/focus.nvim' }
		use({ "RishabhRD/popfix" })
		use({ "RishabhRD/nvim-lsputils" })
		use({ "RRethy/vim-illuminate" })

		-- Snippets
		-- use({ "hrsh7th/vim-vsnip" })
		-- use({ "rafamadriz/friendly-snippets" })
		-- use {'cstrap/python-snippets'}
		-- use {'ylcnfrht/vscode-python-snippet-pack'}
		-- use({ "xabikos/vscode-javascript" })
		-- use {'golang/vscode-go'}
		-- use {'rust-lang/vscode-rust'}
		use({ "SirVer/ultisnips" })
		-- use({ "honza/vim-snippets" })
		-- use({ "norcalli/snippets.nvim" })

		-- Completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lsp",
				"quangnguyen30192/cmp-nvim-ultisnips",
				"hrsh7th/cmp-nvim-lua",
				"octaltree/cmp-look",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-calc",
				"f3fora/cmp-spell",
				"hrsh7th/cmp-emoji",
			},
		})
		-- use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
		-- use {'codota/tabnine-vim'}

		-- Lua development
		use({ "folke/lua-dev.nvim" })
		use({ "rafcamlet/nvim-luapad" })
		-- use {'tjdevries/nlua.nvim'}
		-- use {'metakirby5/codi.vim'}
		-- use {'bfredl/nvim-luadev'}

		-- Plugin development
		-- use {'thinca/vim-themis'}
		-- use {'tpope/vim-scriptease'}
		-- use {'junegunn/vader.vim'}

		-- Clojure Development
		-- use({ "Olical/conjure", tag = "v4.20.0" })
		use({ "dense-analysis/ale" })
		use({ "eraserhd/parinfer-rust", run = "cargo build --release" })
		use({ "dmac/vim-cljfmt", run = "go get github.com/cespare/goclj/cljfmt" })
		use({ "clojure-vim/async-clj-omni" })

		-- Better syntax
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "nvim-treesitter/nvim-treesitter-refactor" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })
		use({
			"romgrk/nvim-treesitter-context",
			config = function()
				require("treesitter-context.config").setup({ enable = true })
			end,
		})
		use({
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
		})
		use({
			"folke/zen-mode.nvim",
			config = function()
				require("zen-mode").setup({})
			end,
		})
		use({
			"folke/twilight.nvim",
			config = function()
				require("twilight").setup({
					dimming = {
						alpha = 0.5, -- amount of dimming
						inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
					},
					context = 7, -- amount of lines we will try to show around the current line
					treesitter = true, -- use treesitter when available for the filetype
					-- treesitter is used to automatically expand the visible text,
					-- but you can further control the types of nodes that should always be fully expanded
					expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
						"function",
						"method",
						"table",
						"if_statement",
					},
					exclude = {}, -- exclude these filetypes
				})
			end,
		})
		-- use {'nvim-treesitter/playground'}

		-- UI/UX ... Dashboard, tabline...
		use({ "akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- use {'glepnir/dashboard-nvim'}
		-- use { 'romgrk/barbar.nvim' }
		-- use {'zefei/vim-wintabs'}
		-- use {'zefei/vim-wintabs-powerline'}
		-- use { 'kdheepak/tabline.nvim', config = function()
		--         require'tabline'.setup {
		--             -- Defaults configuration options
		--             enable = true,
		--             options = {
		--                 section_separators = {'', ''},
		--                 component_separators = {'', ''},
		--             }
		--         }
		--     end,
		--     requires = { { 'hoob3rt/lualine.nvim', opt=true }, { 'kyazdani42/nvim-web-devicons', opt = true} }
		-- }
		-- use({ "simrat39/symbols-outline.nvim" })
		-- aerial is an lsp-outline
		use({ "stevearc/aerial.nvim" })

		-- Status line
		use({
			-- "glepnir/galaxyline.nvim",
			-- branch = "main",
			"NTBBloodbath/galaxyline.nvim",
			config = function()
				require("statusline")
			end,
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		-- Debugging
		-- use({ "puremourning/vimspector" })
		-- use({ "nvim-telescope/telescope-vimspector.nvim" })

		-- Telescope fzf
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

		-- Project
		use({ "nvim-telescope/telescope-project.nvim" })
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({
					detection_methods = { "pattern" },
				})
			end,
		})
		-- use({ "airblade/vim-rooter" })
		-- use {'tpope/vim-projectionist'}

		-- Development workflow
		use({ "voldikss/vim-browser-search" })
		use({ "kkoomen/vim-doge", run = "-> doge#install()" })
		use({ "chrisbra/unicode.vim" })

		-- Rust
		-- use {'rust-lang/rust.vim'}

		-- Database
		-- use {'tpope/vim-dadbod'}
		-- use {'kristijanhusak/vim-dadbod-ui'}
		-- use {'kristijanhusak/vim-dadbod-completion'}
		-- use {'tpope/vim-dotenv' }

		-- Markdown
		use({ "npxbr/glow.nvim", run = ":GlowInstall" })
		-- use {'mzlogin/vim-markdown-toc'}
		-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
		-- use {'godlygeek/tabular'}
		use({ "plasticboy/vim-markdown" })

		-- Devluas
		use({ "editorconfig/editorconfig-vim" })

		-- Documentation/Help/Bookmarks ...
		use({ "sunaku/vim-dasht" })
		use({ "MattesGroeger/vim-bookmarks" })

		-- Writing and note taking
		-- use {'gyim/vim-boxdraw'}
		-- use {'preservim/vim-pencil'}
		-- use {'junegunn/goyo.vim'}
		-- use {'junegunn/limelight.vim'}
		-- use {'preservim/vim-colors-pencil'}
		-- use {'dhruvasagar/vim-dotoo'}
		-- use {'dhruvasagar/vim-table-mode'}
		-- use {'fmoralesc/vim-pad'}
		-- use {'vimwiki/vimwiki', branch = 'dev'}
		-- use {'blindFS/vim-taskwarrior'}
		-- use {'tools-life/taskwiki'}
		-- use {'powerman/vim-plugin-AnsiEsc'}

		-- Git stuff
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("gitsigns").setup({
					signs = {
						add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
						change = {
							hl = "GitSignsChange",
							text = "│",
							numhl = "GitSignsChangeNr",
							linehl = "GitSignsChangeLn",
						},
						delete = {
							hl = "GitSignsDelete",
							text = "_",
							numhl = "GitSignsDeleteNr",
							linehl = "GitSignsDeleteLn",
						},
						topdelete = {
							hl = "GitSignsDelete",
							text = "‾",
							numhl = "GitSignsDeleteNr",
							linehl = "GitSignsDeleteLn",
						},
						changedelete = {
							hl = "GitSignsChange",
							text = "~",
							numhl = "GitSignsChangeNr",
							linehl = "GitSignsChangeLn",
						},
					},
					numhl = false,
					linehl = false,
					keymaps = {
						-- Default keymap options
						noremap = true,
						buffer = true,

						["n ]h"] = {
							expr = true,
							"&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
						},
						["n [h"] = {
							expr = true,
							"&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
						},

						["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
						["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
						["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
						["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
						["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
						["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

						-- Text objects
						["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
						["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
					},
					watch_index = {
						interval = 1000,
					},
					current_line_blame = false,
					sign_priority = 6,
					update_debounce = 100,
					status_formatter = nil, -- Use default
					use_internal_diff = true, -- If luajit is present
				})
			end,
		})
		use({ "sindrets/diffview.nvim" })
		use({
			"TimUntersberger/neogit",
			config = function()
				require("neogit").setup()
			end,
		})

		-- Presentation
		-- use {'sotte/presenting.vim'}
		-- use {'vim-pandoc/vim-pandoc'}
		-- use {'vim-pandoc/vim-pandoc-syntax'}
		-- use {'vim-pandoc/vim-pandoc-after'}

		-- Testing
		-- use {'FooSoft/vim-argwrap'}
		-- use {'preservim/vimux'}

		-- use {'vuciv/vim-bujo'}
		-- use {'freitass/todo.txt-vim'}
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})
		-- use {'oberblastmeister/neuron.nvim', branch = 'unstable', run = 'nix-env -if https://github.com/srid/neuron/archive/master.tar.gz' }

		-- use {'oberblastmeister/neuron.nvim' }
		-- use {'junegunn/fzf', run = '-> fzf#install()' }
		-- use {'junegunn/fzf.vim'}
		-- use {'fiatjaf/neuron.vim' }

		-- Pair Programming
		use({ "Floobits/floobits-neovim" })
		-- -- DAP
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
		use({ "nvim-telescope/telescope-dap.nvim" })
		use({ "theHamsta/nvim-dap-virtual-text" })
		use({ "Pocco81/DAPInstall.nvim" })

		-- Project mgmt
		-- use {'vim-ctrlspace/vim-ctrlspace' }

		-- Embed in browser
		-- use {'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

		-- OSC 52 yank
		-- use {'ojroques/vim-oscyank' }

		-- Jupyter Vim
		-- use {'jupyter-vim/jupyter-vim' }

		-- Scratch pad
		-- use {'metakirby5/codi.vim' }

		-- Slime
		-- use {'jpalardy/vim-slime' }

		-- Cheat.sh ... autoreplace answers to worded problem formulations via stackoverflow background searches
		use({ "dbeniamine/cheat.sh-vim" })

		-- bufutilities
		use({ "smitajit/bufutils.vim" })
		-- use {'arithran/vim-delete-hidden-buffers'}

		-- timetracking
		-- use {'git-time-metric/gtm-vim-plugin'}
		use({ "wakatime/vim-wakatime" })

		-- tmux
		use({ "roxma/vim-tmux-clipboard" })
		-- use {'christoomey/vim-tmux-navigator'}

		use({
			"pwntester/octo.nvim",
			config = function()
				require("octo").setup({
					default_remote = { "upstream", "origin" }, -- order to try remotes
					reaction_viewer_hint_icon = "", -- marker for user reactions
					user_icon = " ", -- user icon
					timeline_marker = "", -- timeline marker
					timeline_indent = "2", -- timeline indentation
					right_bubble_delimiter = "", -- Bubble delimiter
					left_bubble_delimiter = "", -- Bubble delimiter
					github_hostname = "", -- GitHub Enterprise host
					snippet_context_lines = 4, -- number or lines around commented lines
					file_panel = {
						size = 10, -- changed files panel rows
						use_icons = true, -- use web-devicons in file panel
					},
					mappings = {
						issue = {
							close_issue = "<space>ic", -- close issue
							reopen_issue = "<space>io", -- reopen issue
							list_issues = "<space>il", -- list open issues on same repo
							reload = "<C-r>", -- reload issue
							open_in_browser = "<C-b>", -- open issue in browser
							copy_url = "<C-y>", -- copy url to system clipboard
							add_assignee = "<space>aa", -- add assignee
							remove_assignee = "<space>ad", -- remove assignee
							create_label = "<space>lc", -- create label
							add_label = "<space>la", -- add label
							remove_label = "<space>ld", -- remove label
							goto_issue = "<space>gi", -- navigate to a local repo issue
							add_comment = "<space>ca", -- add comment
							delete_comment = "<space>cd", -- delete comment
							next_comment = "]c", -- go to next comment
							prev_comment = "[c", -- go to previous comment
							react_hooray = "<space>rp", -- add/remove 🎉 reaction
							react_heart = "<space>rh", -- add/remove ❤️ reaction
							react_eyes = "<space>re", -- add/remove 👀 reaction
							react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
							react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
							react_rocket = "<space>rr", -- add/remove 🚀 reaction
							react_laugh = "<space>rl", -- add/remove 😄 reaction
							react_confused = "<space>rc", -- add/remove 😕 reaction
						},
						pull_request = {
							checkout_pr = "<space>po", -- checkout PR
							merge_pr = "<space>pm", -- merge PR
							list_commits = "<space>pc", -- list PR commits
							list_changed_files = "<space>pf", -- list PR changed files
							show_pr_diff = "<space>pd", -- show PR diff
							add_reviewer = "<space>va", -- add reviewer
							remove_reviewer = "<space>vd", -- remove reviewer request
							close_issue = "<space>ic", -- close PR
							reopen_issue = "<space>io", -- reopen PR
							list_issues = "<space>il", -- list open issues on same repo
							reload = "<C-r>", -- reload PR
							open_in_browser = "<C-b>", -- open PR in browser
							copy_url = "<C-y>", -- copy url to system clipboard
							add_assignee = "<space>aa", -- add assignee
							remove_assignee = "<space>ad", -- remove assignee
							create_label = "<space>lc", -- create label
							add_label = "<space>la", -- add label
							remove_label = "<space>ld", -- remove label
							goto_issue = "<space>gi", -- navigate to a local repo issue
							add_comment = "<space>ca", -- add comment
							delete_comment = "<space>cd", -- delete comment
							next_comment = "]c", -- go to next comment
							prev_comment = "[c", -- go to previous comment
							react_hooray = "<space>rp", -- add/remove 🎉 reaction
							react_heart = "<space>rh", -- add/remove ❤️ reaction
							react_eyes = "<space>re", -- add/remove 👀 reaction
							react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
							react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
							react_rocket = "<space>rr", -- add/remove 🚀 reaction
							react_laugh = "<space>rl", -- add/remove 😄 reaction
							react_confused = "<space>rc", -- add/remove 😕 reaction
						},
						review_thread = {
							goto_issue = "<space>gi", -- navigate to a local repo issue
							add_comment = "<space>ca", -- add comment
							add_suggestion = "<space>sa", -- add suggestion
							delete_comment = "<space>cd", -- delete comment
							next_comment = "]c", -- go to next comment
							prev_comment = "[c", -- go to previous comment
							select_next_entry = "]q", -- move to previous changed file
							select_prev_entry = "[q", -- move to next changed file
							close_review_tab = "<C-c>", -- close review tab
							react_hooray = "<space>rp", -- add/remove 🎉 reaction
							react_heart = "<space>rh", -- add/remove ❤️ reaction
							react_eyes = "<space>re", -- add/remove 👀 reaction
							react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
							react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
							react_rocket = "<space>rr", -- add/remove 🚀 reaction
							react_laugh = "<space>rl", -- add/remove 😄 reaction
							react_confused = "<space>rc", -- add/remove 😕 reaction
						},
						submit_win = {
							approve_review = "<C-a>", -- approve review
							comment_review = "<C-m>", -- comment review
							request_changes = "<C-r>", -- request changes review
							close_review_tab = "<C-c>", -- close review tab
						},
						review_diff = {
							add_review_comment = "<space>ca", -- add a new review comment
							add_review_suggestion = "<space>sa", -- add a new review suggestion
							focus_files = "<leader>e", -- move focus to changed file panel
							toggle_files = "<leader>b", -- hide/show changed files panel
							next_thread = "]t", -- move to next thread
							prev_thread = "[t", -- move to previous thread
							select_next_entry = "]q", -- move to previous changed file
							select_prev_entry = "[q", -- move to next changed file
							close_review_tab = "<C-c>", -- close review tab
							toggle_viewed = "<leader><space>", -- toggle viewer viewed state
						},
						file_panel = {
							next_entry = "j", -- move to next changed file
							prev_entry = "k", -- move to previous changed file
							select_entry = "<cr>", -- show selected changed file diffs
							refresh_files = "R", -- refresh changed files panel
							focus_files = "<leader>e", -- move focus to changed file panel
							toggle_files = "<leader>b", -- hide/show changed files panel
							select_next_entry = "]q", -- move to previous changed file
							select_prev_entry = "[q", -- move to next changed file
							close_review_tab = "<C-c>", -- close review tab
							toggle_viewed = "<leader><space>", -- toggle viewer viewed state
						},
					},
				})
			end,
		})

		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({})
			end,
		})
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua" .. "/packer_compiled.lua",
		git = {
			clone_timeout = false,
		},
		display = {
			open_fn = require("packer.util").float,
		},
		max_jobs = 16,
	},
})
