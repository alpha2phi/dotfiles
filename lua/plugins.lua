---@diagnostic disable: undefined-global
vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })

		--helper libs and deps
		use({ "nvim-lua/plenary.nvim" })
		use({ "tami5/sqlite.lua" })
		use({ "stevearc/dressing.nvim" })
		use({ "nvim-lua/popup.nvim" })
		use({ "Olical/aniseed" })
		use({
			"rcarriga/nvim-notify",
			event = "VimEnter",
			config = function()
				require("config/notify").setup()
			end,
		})
		-- use({
		-- 	"beauwilliams/focus.nvim",
		-- 	config = function()
		-- 		require("focus").setup({
		-- 			excluded_filetypes = { "floaterm", "aerial" },
		-- 			width = 130,
		-- 			minwidth = 90,
		-- 			bufnew = false,
		-- 		})
		-- 	end,
		-- })
		use({
			"kwkarlwang/bufresize.nvim",
			config = function()
				local opts = { noremap = true, silent = true }
				require("bufresize").setup({
					register = {
						keys = {
							{ "n", "<leader>w<", "30<C-w><", opts },
							{ "n", "<leader>w>", "30<C-w>>", opts },
							{ "n", "<leader>w+", "10<C-w>+", opts },
							{ "n", "<leader>w-", "10<C-w>-", opts },
							{ "n", "<leader>w_", "<C-w>_", opts },
							{ "n", "<leader>w=", "<C-w>=", opts },
							{ "n", "<leader>w|", "<C-w>|", opts },
							{ "n", "<leader>wo", "<C-w>|<C-w>_", opts },
						},
						trigger_events = { "BufWinEnter", "WinEnter" },
					},
					resize = {
						keys = {},
						trigger_events = { "VimResized" },
					},
				})
			end,
		})

		--icons
		use({
			"mortepau/codicons.nvim",
			config = function()
				require("config/codicons").setup()
			end,
		})
		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("config/devicon").setup()
			end,
		})

		-- Development
		use({ "junegunn/fzf", run = "-> fzf#install()" })
		use({ "junegunn/fzf.vim" })

		use({ "tpope/vim-dispatch" })
		use({ "tpope/vim-commentary" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring" })
		use({ "haringsrob/nvim_context_vt" })
		use({ "machakann/vim-sandwich" })
		use({ "tpope/vim-unimpaired" })
		use({ "tpope/vim-sleuth" })
		use({ "tpope/vim-repeat" })
		-- use {'guns/vim-sexp'}
		-- use {'tpope/vim-sexp-mappings-for-regular-people'}
		use({
			"rmagatti/auto-session",
			config = function()
				require("config/auto_session").setup()
			end,
		})

		use({
			"anuvyklack/pretty-fold.nvim",
			config = function()
				require("pretty-fold").setup({})
				require("pretty-fold.preview").setup_keybinding("h")
			end,
		})
		use({
			"gelguy/wilder.nvim",
			config = function()
				require("config/wilder")
			end,
		})
		use({ "wellle/targets.vim" })
		use({
			"phaazon/hop.nvim",
			as = "hop",
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		})
		use({ "indianboy42/hop-extensions" })
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("config/scroll").setup()
			end,
		})
		use({
			"edluffy/specs.nvim",
			config = function()
				require("specs").setup({
					show_jumps = true,
					min_jump = 2,
					popup = {
						delay_ms = 21, -- delay before popup displays
						inc_ms = 5, -- time increments used for fade/resize effects
						blend = 30, -- starting blend, between 0-100 (fully transparent), see :h winblend
						width = 50,
						winhl = "PMenu",
						fader = require("specs").linear_fader,
						resizer = require("specs").shrink_resizer,
					},
					ignore_filetypes = {},
					ignore_buftypes = {
						nofile = true,
					},
				})
			end,
		})
		use({ "unblevable/quick-scope" })
		use({ "voldikss/vim-floaterm" })
		use({ "windwp/vim-floaterm-repl" })
		-- use({ "jiangmiao/auto-pairs" })
		use({ "windwp/nvim-ts-autotag" })
		use({
			"windwp/nvim-autopairs",
			requires = { "windwp/nvim-ts-autotag" },
			config = function()
				require("config/autopairs").setup()
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("config/colorizer").setup()
			end,
		})
		use({ "lokaltog/neoranger" })
		use({ "diepm/vim-rest-console" })
		-- use({ "hkupty/iron.nvim" }) --Interactive REPL
		use({
			"kosayoda/nvim-lightbulb",
			config = function()
				require("config/lightbulb").setup()
			end,
		})
		-- Color
		use({
			"glepnir/indent-guides.nvim",
			branch = "main",
			config = function()
				local even_colors = nil
				local odd_colors = nil
				if vim.opt.background:get() == "light" then
					even_colors = { fg = "#FC5C94", bg = "#FC5C94" }
					odd_colors = { fg = "#333333", bg = "#333333" }
				else
					even_colors = { fg = "#5d4d7a", bg = "#5d4d7a" }
					odd_colors = { fg = "#cdcdcd", bg = "#cdcdcd" }
				end
				require("indent_guides").setup({
					indent_levels = 30,
					indent_guide_size = 1,
					indent_start_level = 1,
					indent_enable = true,
					indent_space_guides = true,
					indent_tab_guides = false,
					indent_soft_pattern = "\\s",
					exclude_filetypes = {
						"help",
						"dashboard",
						"dashpreview",
						"NvimTree",
						"vista",
						"sagahover",
						"aerial",
						"AERIAL",
						"minimap",
						"Minimap",
						"MINIMAP",
						"-MINIMAP-",
					},
					even_colors = even_colors,
					odd_colors = odd_colors,
				})
			end,
		})

		-- colorschemes
		-- use({ "tjdevries/colorbuddy.vim" })
		use({ "rktjmp/lush.nvim" })
		use({ "savq/melange" })
		-- use({ "adisen99/codeschool.nvim" })
		-- use({ "joehannes-ux/lush-jsx.nvim" })
		use({ "olimorris/onedarkpro.nvim" })
		use({ "pineapplegiant/spaceduck" })
		-- use({ "Iron-E/nvim-highlite" })
		-- use({ "navarasu/onedark.nvim" })
		use({ "NLKNguyen/papercolor-theme" })
		use({ "sainnhe/everforest" })
		-- use({ "Th3Whit3Wolf/spacebuddy" })
		use({ "mhartington/oceanic-next" })
		use({ "kyoz/purify" })
		use({ "tanvirtin/monokai.nvim" })
		use({ "catppuccin/nvim", as = "catppuccin" })
		use({ "joehannes-ux/kat.nvim" })
		use({ "sainnhe/edge" })
		use({ "rafamadriz/neon" })
		use({
			"themercorp/themer.lua",
			config = function()
				require("themer").setup({
					styles = {
						comment = {},
						["function"] = { style = "italic" },
						functionbuiltin = { style = "italic,bold" },
						variable = { style = "italic" },
						variableBuiltIn = { style = "italic,bold" },
						parameter = { style = "italic" },
					},
				})
			end,
		})
		-- use({
		-- 	"projekt0n/github-nvim-theme",
		-- 	config = function()
		-- 		require("github-theme").setup()
		-- 	end,
		-- })
		use({ "folke/tokyonight.nvim" })

		-- Testing
		use({ "vim-test/vim-test" })
		use({ "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" })

		-- Debugging
		use({ "puremourning/vimspector" })

		-- Telescope
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		})
		use({
			"nvim-telescope/telescope-arecibo.nvim",
			-- rocks = { "openssl", "lua-http-parser" }, -- openssl not available for lua >5.3
		})
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"tami5/sqlite.lua",
				"nvim-telescope/telescope-project.nvim",
				"nvim-telescope/telescope-smart-history.nvim",
				"nvim-telescope/telescope-frecency.nvim",
				"nvim-telescope/telescope-symbols.nvim",
				"nvim-telescope/telescope-github.nvim",
				"joehannes-os/telescope-media-files.nvim",
				"tom-anders/telescope-vim-bookmarks.nvim",
				"sudormrfbin/cheatsheet.nvim",
				"AckslD/nvim-neoclip.lua",
				"rmagatti/auto-session",
				"rmagatti/session-lens",
			},
			config = function()
				local config = require("config/telescope")
				local neoclip = require("config/neoclip")

				config.setup()
				neoclip.setup()
				require("session-lens").setup({
					path_display = { "shorten" },
					theme_conf = { border = false },
					previewer = false,
				})
			end,
		})

		-- use { 'nvim-telescope/telescope-packer.nvim ' }
		-- use({ "nvim-telescope/telescope-snippets.nvim" })

		-- Better LSP experience
		-- LSP config
		use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
		-- use({ "glepnir/lspsaga.nvim" })
		-- use({ "jasonrhansen/lspsaga.nvim", branch = "finder-preview-fixes" })
		use({
			"tami5/lspsaga.nvim",
			requires = { "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" },
			config = function()
				require("config/lspsaga").setup()
			end,
		})
		use({
			"onsails/lspkind-nvim",
			config = function()
				require("config/lspkind").setup()
			end,
		})
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
		use({
			"creativenull/efmls-configs-nvim",
			requires = { "neovim/nvim-lspconfig" },
		})
		use({
			"rmagatti/goto-preview",
			config = function()
				require("goto-preview").setup({
					default_mappings = true,
					resizing_mappings = true,
					dismiss_on_move = true,
					opacity = 10,
				})
			end,
		})
		-- use {'sbdchd/neoformat'}
		use({
			"mhartington/formatter.nvim",
			config = function()
				require("config/formatter").setup()
			end,
		})
		use({ "p00f/nvim-ts-rainbow" })
		use({ "ray-x/lsp_signature.nvim" })
		use({
			"folke/lsp-colors.nvim",
			config = function()
				require("config/lspcolors").setup()
			end,
		})
		-- use {'szw/vim-maximizer'}
		-- use {'dyng/ctrlsf.vim'}
		-- use {'pechorin/any-jump.vim'}
		use({ "kshenoy/vim-signature" })
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("config/trouble").setup()
			end,
		})
		use({
			"petertriho/nvim-scrollbar",
			config = function()
				require("config/scrollbar").setup()
			end,
		})
		use({
			"kevinhwang91/nvim-hlslens",
			config = function()
				require("config/hlslens").setup()
			end,
		})
		-- use({
		-- 	"wfxr/minimap.vim",
		-- 	run = "cargo install --locked code-minimap",
		-- })
		-- use({
		-- 	"onsails/diaglist.nvim",
		-- 	config = function()
		-- 		require("diaglist").init({
		-- 			-- increase for noisy servers
		-- 			debounce_ms = 1000,
		-- 			-- use loclist for buf_diag only => false
		-- 			-- use qflist for buf_diag only => true -> losing all diag list
		-- 			buf_clients_only = false,
		-- 		})
		-- 	end,
		-- })
		use({ "mhinz/vim-grepper" })
		use({
			"kevinhwang91/nvim-bqf",
			config = function()
				require("config/bqf").setup()
			end,
		})
		-- use({ "junegunn/vim-peekaboo" })
		-- use {'gennaro-tedesco/nvim-peekup'}
		-- use {'lukas-reineke/indent-blankline.nvim' }
		-- use {'Yggdroot/indentLine' }
		-- use({
		-- 	"luukvbaal/stabilize.nvim",
		-- 	config = function()
		-- 		require("stabilize").setup({
		-- 			force = true, -- stabilize window even when current cursor position will be hidden behind new window
		-- 			forcemark = "z", -- set context mark to register on force event which can be jumped to with '<forcemark>
		-- 			ignore = { -- do not manage windows matching these file/buftypes
		-- 				filetype = { "help", "list", "Trouble" },
		-- 				buftype = { "terminal", "quickfix", "loclist" },
		-- 			},
		-- 			nested = "QuickFixCmdPost,DiagnosticChanged *",
		-- 		})
		-- 	end,
		-- })
		-- use({ "RishabhRD/popfix" })
		-- use({ "RishabhRD/nvim-lsputils" })
		use({ "RRethy/vim-illuminate" })

		use({
			"github/copilot.vim",
			config = function()
				require("config/copilot").setup()
			end,
		})

		-- Snippets
		use({ "hrsh7th/cmp-vsnip" })
		use({ "hrsh7th/vim-vsnip" })
		use({ "rafamadriz/friendly-snippets" })
		-- use {'cstrap/python-snippets'}
		-- use {'ylcnfrht/vscode-python-snippet-pack'}
		use({ "xabikos/vscode-javascript" })
		use({ "stevearc/vim-vsnip-snippets" })
		-- use {'golang/vscode-go'}
		-- use {'rust-lang/vscode-rust'}
		-- use({
		-- 	"SirVer/ultisnips",
		-- 	requires = { { "honza/vim-snippets", rtp = "." } },
		-- 	config = function()
		-- 		vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
		-- 		vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
		-- 		vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
		-- 		vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
		-- 		vim.g.UltiSnipsRemoveSelectModeMappings = 0
		-- 	end,
		-- })
		-- use({ "norcalli/snippets.nvim" })

		use({
			"David-Kunz/cmp-npm",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("cmp-npm").setup({})
			end,
		})
		-- Completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-vsnip",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lua",
				"octaltree/cmp-look",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-calc",
				"f3fora/cmp-spell",
				"hrsh7th/cmp-emoji",
				"ray-x/cmp-treesitter",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				"David-Kunz/cmp-npm",
			},
			config = function()
				require("config/completion").setup()
			end,
		})
		-- use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
		-- use {'codota/tabnine-vim'}

		use({
			"abecodes/tabout.nvim",
			config = function()
				require("tabout").setup({
					tabkey = ";l", -- key to trigger tabout, set to an empty string to disable
					backwards_tabkey = ";h", -- key to trigger backwards tabout, set to an empty string to disable
					act_as_tab = false, -- shift content if tab out is not possible
					act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
					enable_backwards = true, -- well ...
					completion = false, -- if the tabkey is used in a completion pum
					tabouts = {
						{ open = "'", close = "'" },
						{ open = '"', close = '"' },
						{ open = "`", close = "`" },
						{ open = "(", close = ")" },
						{ open = "[", close = "]" },
						{ open = "{", close = "}" },
						{ open = "<", close = ">" },
					},
					ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
					exclude = {}, -- tabout will ignore these filetypes
				})
			end,
			wants = { "nvim-treesitter" }, -- or require if not used so far
			after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
		})
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
		-- use({ "dense-analysis/ale" })
		use({ "eraserhd/parinfer-rust", run = "cargo build --release" })
		-- use({ "dmac/vim-cljfmt", run = "go get github.com/cespare/goclj/cljfmt" })
		-- use({ "clojure-vim/async-clj-omni" })

		-- Better syntax
		use({ "sheerun/vim-polyglot" }) -- don't know it obsolete because of treesitter
		-- use({ "othree/yajs.vim" }) -- probably included in polyglot
		use({ "othree/es.next.syntax.vim" })
		use({ "othree/javascript-libraries-syntax.vim" })
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("config/treesitter").setup()
			end,
		})
		use({
			"nvim-treesitter/nvim-treesitter-refactor",
			config = function()
				require("nvim-treesitter.configs").setup({
					refactor = {
						highlight_definitions = {
							enable = true,
							-- Set to false if you have an `updatetime` of ~100.
							clear_on_cursor_move = true,
						},
						highlight_current_scope = { enable = true },
						navigation = {
							enable = true,
							keymaps = {
								goto_previous_usage = "<leader>#",
								goto_next_usage = "<leader>*",
							},
						},
					},
				})
			end,
		})
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })
		use({ "RRethy/nvim-treesitter-textsubjects" })
		use({
			"romgrk/nvim-treesitter-context",
			config = function()
				require("treesitter-context").setup({
					enable = true,
					throttle = true,
					max_lines = 0,
					patterns = {
						default = {
							"class",
							"function",
							"method",
							"for",
							"while",
							"if",
							"switch",
							"case",
						},
					},
				})
			end,
		})
		use({
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
		})
		use({
			"mizlan/iswap.nvim",
			config = function()
				require("iswap").setup({})
			end,
		})
		use({
			"folke/zen-mode.nvim",
			config = function()
				require("config/zen").setup()
			end,
		})
		use({
			"folke/twilight.nvim",
			config = function()
				require("twilight").setup({
					dimming = {
						alpha = 0.73, -- amount of dimming
						inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
					},
					context = 21, -- amount of lines we will try to show around the current line
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
		-- use({
		-- 	"sunjon/shade.nvim",
		-- 	config = function()
		-- 		require("shade").setup({
		-- 			overlay_opacity = 50,
		-- 			opacity_step = 1,
		-- 			keys = {
		-- 				brightness_up = "<C-Up>",
		-- 				brightness_down = "<C-Down>",
		-- 				toggle = "<Leader><Leader>",
		-- 			},
		-- 		})
		-- 	end,
		-- })
		-- use {'nvim-treesitter/playground'}

		-- UI/UX ... Dashboard, tabline...
		use({
			"akinsho/nvim-bufferline.lua",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("config/bufferline").setup()
			end,
		})
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
		use({
			"stevearc/aerial.nvim",
			config = function()
				require("config/aerial").setup()
			end,
		})
		-- use({
		-- "ldelossa/litee.nvim",
		-- config = function()
		-- 	require("litee.lib").setup()
		-- end,
		-- })
		-- use({
		-- "ldelossa/litee-calltree.nvim",
		-- config = function()
		-- 	require("litee.calltree").setup()
		-- end,
		-- })
		-- Status line
		use({
			-- "glepnir/galaxyline.nvim",
			-- branch = "main",
			"NTBBloodbath/galaxyline.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		-- Project
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
		-- for persisting global bookmarks
		use({ "MattesGroeger/vim-bookmarks" })
		-- for non-persisting grouped bookmarks
		use({
			"chentau/marks.nvim",
			config = function()
				require("marks").setup({
					mappings = {
						delete_bookmark = "md.",
						set_bookmark0 = "m0",
						delete_bookmark0 = "md0",
						next_bookmark0 = "]m0",
						prev_bookmark0 = "[m0",
						set_bookmark1 = "m1",
						delete_bookmark1 = "md1",
						next_bookmark1 = "]m1",
						prev_bookmark1 = "[m1",
						set_bookmark2 = "m2",
						delete_bookmark2 = "md2",
						next_bookmark2 = "]m2",
						prev_bookmark2 = "[m2",
						set_bookmark3 = "m3",
						delete_bookmark3 = "md3",
						next_bookmark3 = "]m3",
						prev_bookmark3 = "[m3",
						set_bookmark4 = "m4",
						delete_bookmark4 = "md4",
						next_bookmark4 = "]m4",
						prev_bookmark4 = "[m4",
						set_bookmark5 = "m5",
						delete_bookmark5 = "md5",
						next_bookmark5 = "]m5",
						prev_bookmark5 = "[m5",
						set_bookmark6 = "m6",
						delete_bookmark6 = "md6",
						next_bookmark6 = "]m6",
						prev_bookmark6 = "[m6",
						set_bookmark7 = "m7",
						delete_bookmark7 = "md7",
						next_bookmark7 = "]m7",
						prev_bookmark7 = "[m7",
						set_bookmark8 = "m8",
						delete_bookmark8 = "md8",
						next_bookmark8 = "]m8",
						prev_bookmark8 = "[m8",
						set_bookmark9 = "m9",
						delete_bookmark9 = "md9",
						next_bookmark9 = "]m9",
						prev_bookmark9 = "[m9",
					},
					bookmark_0 = {
						sign = "",
						virt_text = " ( 0) ",
					},
					bookmark_1 = {
						sign = "",
						virt_text = " ( 1) ",
					},
					bookmark_2 = {
						sign = "",
						virt_text = " ( 2) ",
					},
					bookmark_3 = {
						sign = "",
						virt_text = " ( 3) ",
					},
					bookmark_4 = {
						sign = "",
						virt_text = " ( 4) ",
					},
					bookmark_5 = {
						sign = "",
						virt_text = " ( 5) ",
					},
					bookmark_6 = {
						sign = "",
						virt_text = " ( 6) ",
					},
					bookmark_7 = {
						sign = "",
						virt_text = " ( 7) ",
					},
					bookmark_8 = {
						sign = "",
						virt_text = " ( 8) ",
					},
					bookmark_9 = {
						sign = "",
						virt_text = " ( 9) ",
					},
				})
			end,
		})

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
					current_line_blame = true,
					sign_priority = 6,
					update_debounce = 100,
					status_formatter = nil, -- Use default
					use_internal_diff = true, -- If luajit is present
				})
			end,
		})
		use({
			"sindrets/diffview.nvim",
			config = function()
				require("config/diffview").setup()
			end,
		})
		use({
			"TimUntersberger/neogit",
			config = function()
				require("neogit").setup({ integrations = { diffview = true } })
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
		use({
			"ruifm/gitlinker.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("gitlinker").setup({
					opts = {
						remote = nil, -- force the use of a specific remote
						-- adds current line nr in the url for normal mode
						add_current_line_on_normal_mode = true,
						-- callback for what to do with the url
						action_callback = require("gitlinker.actions").copy_to_clipboard,
						-- print the url after performing the action
						print_url = true,
					},
					callbacks = {
						["github.com"] = require("gitlinker.hosts").get_github_type_url,
						["gitlab.com"] = require("gitlinker.hosts").get_gitlab_type_url,
						["try.gitea.io"] = require("gitlinker.hosts").get_gitea_type_url,
						["codeberg.org"] = require("gitlinker.hosts").get_gitea_type_url,
						["bitbucket.org"] = require("gitlinker.hosts").get_bitbucket_type_url,
						["try.gogs.io"] = require("gitlinker.hosts").get_gogs_type_url,
						["git.sr.ht"] = require("gitlinker.hosts").get_srht_type_url,
						["git.launchpad.net"] = require("gitlinker.hosts").get_launchpad_type_url,
						["repo.or.cz"] = require("gitlinker.hosts").get_repoorcz_type_url,
						["git.kernel.org"] = require("gitlinker.hosts").get_cgit_type_url,
						["git.savannah.gnu.org"] = require("gitlinker.hosts").get_cgit_type_url,
					},
				})
			end,
		})
		-- use {'oberblastmeister/neuron.nvim', branch = 'unstable', run = 'nix-env -if https://github.com/srid/neuron/archive/master.tar.gz' }

		-- use {'oberblastmeister/neuron.nvim' }
		-- use {'fiatjaf/neuron.vim' }

		-- Pair Programming
		-- use({ "Floobits/floobits-neovim" })
		-- -- DAP
		-- use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
		-- use({ "nvim-telescope/telescope-dap.nvim" })
		-- use({ "theHamsta/nvim-dap-virtual-text" })
		-- use({ "Pocco81/DAPInstall.nvim" })

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
		-- use({ "arithran/vim-delete-hidden-buffers" })
		use({
			"kazhala/close-buffers.nvim",
			requires = { "akinsho/nvim-bufferline.lua" },
			config = function()
				require("close_buffers").setup({
					file_glob_ignore = { "src/**/*" },
					preserve_window_layout = { "this", "nameless" },
					next_buffer_cmd = function(windows)
						require("bufferline").cycle(1)
						local bufnr = vim.api.nvim_get_current_buf()

						for _, window in ipairs(windows) do
							vim.api.nvim_win_set_buf(window, bufnr)
						end
					end,
				})
			end,
		})

		-- timetracking
		-- use {'git-time-metric/gtm-vim-plugin'}
		use({ "wakatime/vim-wakatime" })

		-- tmux
		use({ "roxma/vim-tmux-clipboard" })
		-- use {'christoomey/vim-tmux-navigator'}

		-- use({
		-- 	"pwntester/octo.nvim",
		-- 	config = function()
		-- 		require("octo").setup({
		-- 			default_remote = { "upstream", "origin" }, -- order to try remotes
		-- 			reaction_viewer_hint_icon = "", -- marker for user reactions
		-- 			user_icon = " ", -- user icon
		-- 			timeline_marker = "", -- timeline marker
		-- 			timeline_indent = "2", -- timeline indentation
		-- 			right_bubble_delimiter = "", -- Bubble delimiter
		-- 			left_bubble_delimiter = "", -- Bubble delimiter
		-- 			github_hostname = "", -- GitHub Enterprise host
		-- 			snippet_context_lines = 4, -- number or lines around commented lines
		-- 			file_panel = {
		-- 				size = 10, -- changed files panel rows
		-- 				use_icons = true, -- use web-devicons in file panel
		-- 			},
		-- 			mappings = {
		-- 				issue = {
		-- 					close_issue = "<space>ic", -- close issue
		-- 					reopen_issue = "<space>io", -- reopen issue
		-- 					list_issues = "<space>il", -- list open issues on same repo
		-- 					reload = "<C-r>", -- reload issue
		-- 					open_in_browser = "<C-b>", -- open issue in browser
		-- 					copy_url = "<C-y>", -- copy url to system clipboard
		-- 					add_assignee = "<space>aa", -- add assignee
		-- 					remove_assignee = "<space>ad", -- remove assignee
		-- 					create_label = "<space>lc", -- create label
		-- 					add_label = "<space>la", -- add label
		-- 					remove_label = "<space>ld", -- remove label
		-- 					goto_issue = "<space>gi", -- navigate to a local repo issue
		-- 					add_comment = "<space>ca", -- add comment
		-- 					delete_comment = "<space>cd", -- delete comment
		-- 					next_comment = "]c", -- go to next comment
		-- 					prev_comment = "[c", -- go to previous comment
		-- 					react_hooray = "<space>rp", -- add/remove 🎉 reaction
		-- 					react_heart = "<space>rh", -- add/remove ❤️ reaction
		-- 					react_eyes = "<space>re", -- add/remove 👀 reaction
		-- 					react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
		-- 					react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
		-- 					react_rocket = "<space>rr", -- add/remove 🚀 reaction
		-- 					react_laugh = "<space>rl", -- add/remove 😄 reaction
		-- 					react_confused = "<space>rc", -- add/remove 😕 reaction
		-- 				},
		-- 				pull_request = {
		-- 					checkout_pr = "<space>po", -- checkout PR
		-- 					merge_pr = "<space>pm", -- merge PR
		-- 					list_commits = "<space>pc", -- list PR commits
		-- 					list_changed_files = "<space>pf", -- list PR changed files
		-- 					show_pr_diff = "<space>pd", -- show PR diff
		-- 					add_reviewer = "<space>va", -- add reviewer
		-- 					remove_reviewer = "<space>vd", -- remove reviewer request
		-- 					close_issue = "<space>ic", -- close PR
		-- 					reopen_issue = "<space>io", -- reopen PR
		-- 					list_issues = "<space>il", -- list open issues on same repo
		-- 					reload = "<C-r>", -- reload PR
		-- 					open_in_browser = "<C-b>", -- open PR in browser
		-- 					copy_url = "<C-y>", -- copy url to system clipboard
		-- 					add_assignee = "<space>aa", -- add assignee
		-- 					remove_assignee = "<space>ad", -- remove assignee
		-- 					create_label = "<space>lc", -- create label
		-- 					add_label = "<space>la", -- add label
		-- 					remove_label = "<space>ld", -- remove label
		-- 					goto_issue = "<space>gi", -- navigate to a local repo issue
		-- 					add_comment = "<space>ca", -- add comment
		-- 					delete_comment = "<space>cd", -- delete comment
		-- 					next_comment = "]c", -- go to next comment
		-- 					prev_comment = "[c", -- go to previous comment
		-- 					react_hooray = "<space>rp", -- add/remove 🎉 reaction
		-- 					react_heart = "<space>rh", -- add/remove ❤️ reaction
		-- 					react_eyes = "<space>re", -- add/remove 👀 reaction
		-- 					react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
		-- 					react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
		-- 					react_rocket = "<space>rr", -- add/remove 🚀 reaction
		-- 					react_laugh = "<space>rl", -- add/remove 😄 reaction
		-- 					react_confused = "<space>rc", -- add/remove 😕 reaction
		-- 				},
		-- 				review_thread = {
		-- 					goto_issue = "<space>gi", -- navigate to a local repo issue
		-- 					add_comment = "<space>ca", -- add comment
		-- 					add_suggestion = "<space>sa", -- add suggestion
		-- 					delete_comment = "<space>cd", -- delete comment
		-- 					next_comment = "]c", -- go to next comment
		-- 					prev_comment = "[c", -- go to previous comment
		-- 					select_next_entry = "]q", -- move to previous changed file
		-- 					select_prev_entry = "[q", -- move to next changed file
		-- 					close_review_tab = "<C-c>", -- close review tab
		-- 					react_hooray = "<space>rp", -- add/remove 🎉 reaction
		-- 					react_heart = "<space>rh", -- add/remove ❤️ reaction
		-- 					react_eyes = "<space>re", -- add/remove 👀 reaction
		-- 					react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
		-- 					react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
		-- 					react_rocket = "<space>rr", -- add/remove 🚀 reaction
		-- 					react_laugh = "<space>rl", -- add/remove 😄 reaction
		-- 					react_confused = "<space>rc", -- add/remove 😕 reaction
		-- 				},
		-- 				submit_win = {
		-- 					approve_review = "<C-a>", -- approve review
		-- 					comment_review = "<C-m>", -- comment review
		-- 					request_changes = "<C-r>", -- request changes review
		-- 					close_review_tab = "<C-c>", -- close review tab
		-- 				},
		-- 				review_diff = {
		-- 					add_review_comment = "<space>ca", -- add a new review comment
		-- 					add_review_suggestion = "<space>sa", -- add a new review suggestion
		-- 					focus_files = "<leader>e", -- move focus to changed file panel
		-- 					toggle_files = "<leader>b", -- hide/show changed files panel
		-- 					next_thread = "]t", -- move to next thread
		-- 					prev_thread = "[t", -- move to previous thread
		-- 					select_next_entry = "]q", -- move to previous changed file
		-- 					select_prev_entry = "[q", -- move to next changed file
		-- 					close_review_tab = "<C-c>", -- close review tab
		-- 					toggle_viewed = "<leader><space>", -- toggle viewer viewed state
		-- 				},
		-- 				file_panel = {
		-- 					next_entry = "j", -- move to next changed file
		-- 					prev_entry = "k", -- move to previous changed file
		-- 					select_entry = "<cr>", -- show selected changed file diffs
		-- 					refresh_files = "R", -- refresh changed files panel
		-- 					focus_files = "<leader>e", -- move focus to changed file panel
		-- 					toggle_files = "<leader>b", -- hide/show changed files panel
		-- 					select_next_entry = "]q", -- move to previous changed file
		-- 					select_prev_entry = "[q", -- move to next changed file
		-- 					close_review_tab = "<C-c>", -- close review tab
		-- 					toggle_viewed = "<leader><space>", -- toggle viewer viewed state
		-- 				},
		-- 			},
		-- 		})
		-- 	end,
		-- })

		use({
			"Krafi2/jeskape.nvim",
			config = function()
				require("jeskape").setup({
					-- Mappings are specified in this table. Jeskape uses neovim's keymap
					-- system under the hood, so anything allowed in a normal `map`'s righ hand
					-- side will work here too. Check out ':h  map.txt' to see what's possible.
					mappings = {
						-- Typing `hi` quickly will cause the string `hello!` to be inserted.
						-- hi = "hello!",
						-- They can also be specified in a tree-like format.
						j = {
							-- Here `jk` will escape insert mode.
							k = "<cmd>stopinsert<cr><cmd>w!<cr>",
							-- You can have as many layers as you want!
							-- h = {
							-- 	g = "<cmd>stopinsert<cr>",
							-- },
							-- If the mapping leads to a function, it will be evaluated every
							-- time the mapping is reached and its return value will be fed to
							-- neovim.
							-- f = function()
							-- 	print("Oh look, a function!")
							-- 	-- Insert the name of the current file.
							-- 	return vim.fn.expand("%:t")
							-- end,
						},
						-- You can use lua's arbitrary key notation to map special characters
						-- move to end of WORD and enter insert mode after that char
						[";;"] = "<cmd>stopinsert<cr><cmd>w!<cr><cmd>normal E<cr><cmd>startinsert<cr>",
						[";l"] = "<cmd>stopinsert<cr><cmd>normal f)a<cr>",
						[";h"] = "<cmd>stopinsert<cr><cmd>normal F(a<cr>",
						["<Esc>"] = "<cmd>stopinsert<cr>",
						-- Use `<cmd>` to map commands. Be carful to terminate the command with `<cr>`.
						-- ff = "<cmd>echo 'commands work too'<cr>",
					},
					-- The maximum length of time between keystrokes where they are still
					-- considered a part of the same mapping.
					timeout = vim.o.timeoutlen,
				})
			end,
		})

		--keymappings
		use({ "LionC/nest.nvim" })

		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({})
			end,
		})
	end,
})
