return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- TODO: - Fine tune the performance
    -- -- Config
    -- use {
    --     'dstein64/vim-startuptime',
    --     cmd = 'StartupTime',
    --     config = [[vim.g.startuptime_tries = 10]]
    -- }

    -- Development
    use {'tpope/vim-dispatch'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-rhubarb'}
    use {'tpope/vim-unimpaired'}
    use {'tpope/vim-vinegar'}
    use {'tpope/vim-sleuth'}
    use {'wellle/targets.vim'}
    -- use {'phaazon/hop.nvim'}
    -- TODO: Try out
    -- use {'ggandor/lightspeed.nvim'}
    use {'easymotion/vim-easymotion'}
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        'TimUntersberger/neogit',
        config = function()
            require('neogit').setup {integrations = {diffview = true}}
        end
    }
    use {'sindrets/diffview.nvim'}
    use {'unblevable/quick-scope'}
    use {'voldikss/vim-floaterm'}
    use {
        'folke/which-key.nvim',
        config = function() require("which-key").setup {} end
    }
    use {'chrisbra/NrrwRgn'}
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use {
        'windwp/nvim-spectre',
        config = function() require("config.spectre") end
    }
    use {
        'ruifm/gitlinker.nvim',
        config = function() require("gitlinker").setup() end
    }
    use {
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = function() require("persistence").setup() end
    }
    use {
        'windwp/nvim-autopairs',
        after = "nvim-compe",
        run = 'make',
        config = function()
            require('nvim-autopairs').setup {
                require("nvim-autopairs.completion.compe").setup({
                    map_cr = true,
                    map_complete = true,
                    auto_select = false
                })
            }
        end
    }
    -- use {'tamago324/lir.nvim'}
    -- use {'jiangmiao/auto-pairs'}
    -- use {'rhysd/committia.vim'}
    -- use {
    --     "akinsho/nvim-toggleterm.lua",
    --     config = function() require("toggleterm").setup {} end
    -- }
    -- use {'tpope/vim-characterize'}
    -- use {'liuchengxu/vim-which-key'}
    -- use {'norcalli/nvim-colorizer.lua'}
    -- use {'kevinhwang91/rnvimr'}
    -- use {'francoiscabrol/ranger.vim'}
    -- use {'rbgrouleff/bclose.vim'}
    -- use {'christoomey/vim-tmux-navigator'}
    -- use {'mhinz/vim-signify'}
    -- use {'radenling/vim-dispatch-neovim' }

    -- Color scheme
    use {'kyazdani42/nvim-web-devicons'}
    use {'sainnhe/gruvbox-material'}
    use {'NLKNguyen/papercolor-theme'}
    -- use {'sainnhe/edge'}
    -- use {'folke/tokyonight.nvim'}
    -- use {'joshdick/onedark.vim'}

    -- Testing
    use {
        "rcarriga/vim-ultest",
        config = "require('config.ultest').post()",
        run = ":UpdateRemotePlugins",
        requires = {"vim-test/vim-test"}
    }
    -- use {'vim-test/vim-test'}

    -- Telescope
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {
        'nvim-telescope/telescope-frecency.nvim',
        requires = {'tami5/sql.nvim'},
        config = function()
            require('telescope').load_extension('frecency')
        end
    }
    use {'nvim-telescope/telescope-symbols.nvim'}
    use {'nvim-telescope/telescope-github.nvim'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {"nvim-telescope/telescope-hop.nvim"}

    -- TODO: to try
    -- use {'camspiers/snap'}
    -- use {
    --     'nvim-telescope/telescope-arecibo.nvim',
    --     rocks = {"openssl", "lua-http-parser"}
    -- }
    -- use { 'nvim-telescope/telescope-media-files.nvim' }
    -- use { 'nvim-telescope/telescope-packer.nvim ' }

    -- LSP config
    use {'neovim/nvim-lspconfig'}
    -- use {'kabouzeid/nvim-lspinstall'}

    -- Completion - use either one of this
    use {'hrsh7th/nvim-compe'}
    -- use { 'nvim-lua/completion-nvim' }

    -- Better LSP experience
    use {'tjdevries/astronauta.nvim'}
    use {'glepnir/lspsaga.nvim'}
    use {'onsails/lspkind-nvim'}
    use {'sbdchd/neoformat'}
    use {'p00f/nvim-ts-rainbow'}
    use {'ray-x/lsp_signature.nvim'}
    use {'szw/vim-maximizer'}
    use {'dyng/ctrlsf.vim'}
    use {'dbeniamine/cheat.sh-vim'}
    use {'pechorin/any-jump.vim'}
    use {'kshenoy/vim-signature'}
    use {'kevinhwang91/nvim-bqf'}
    use {
        "folke/trouble.nvim",
        config = function() require("trouble").setup {} end
    }
    use {
        "mfussenegger/nvim-ts-hint-textobject",
        config = function()
            vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
            vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
        end
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("todo-comments").setup {} end
    }
    use {'RRethy/nvim-treesitter-textsubjects'}
    use {
        'ThePrimeagen/refactoring.nvim',
        config = function() require("config.refactoring") end
    }

    -- TODO: Further test
    -- use {
    --     'jose-elias-alvarez/null-ls.nvim'
    -- config = function()
    --     local null_ls = require("null-ls")
    --     local sources = {
    --         null_ls.builtins.formatting.prettier,
    --         null_ls.builtins.diagnostics.write_good,
    --         null_ls.builtins.code_actions.gitsigns,
    --         null_ls.builtins.formatting.lua_format
    --     }
    --     null_ls.config({sources = sources})
    --     require("lspconfig")["null-ls"].setup({})
    -- end
    -- }
    -- use {
    --     'ray-x/navigator.lua',
    --     requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
    --     config = function() require("navigator").setup {} end
    -- }

    -- use {'nvim-lua/lsp-status.nvim'}
    -- use {
    --     "folke/todo-comments.nvim",
    --     config = function() require("todo-comments").setup {} end
    -- }
    -- use {'TaDaa/vimade'}
    -- use {'junegunn/vim-peekaboo'}
    -- use {'gennaro-tedesco/nvim-peekup'}
    -- use {'wellle/context.vim'}
    -- use {'lukas-reineke/indent-blankline.nvim' }
    -- use {'Yggdroot/indentLine' }
    -- use {'beauwilliams/focus.nvim' }
    -- use {'RRethy/vim-illuminate' }
    -- use {'kosayoda/nvim-lightbulb' }

    -- Snippets
    use {
        'hrsh7th/vim-vsnip',
        requires = {
            'rafamadriz/friendly-snippets', 'cstrap/python-snippets',
            'ylcnfrht/vscode-python-snippet-pack', 'xabikos/vscode-javascript',
            'golang/vscode-go', 'rust-lang/vscode-rust'
        }
    }
    use {
        'norcalli/snippets.nvim',
        config = function() require("config.snippets") end
    }
    -- use { 'honza/vim-snippets' }
    -- use { 'SirVer/ultisnips' }
    -- use { 'nvim-telescope/telescope-snippets.nvim' }

    -- Lua development
    use {'folke/lua-dev.nvim'}
    use {'simrat39/symbols-outline.nvim'}
    use {'~/workspace/dev/alpha2phi/alpha.nvim'}
    -- use {'bryall/contextprint.nvim'}
    -- use {'nanotee/nvim-lua-guide'}
    -- use {'rafcamlet/nvim-luapad'}
    -- use {'thinca/vim-themis'}
    -- use {'tpope/vim-scriptease'}
    -- use {'junegunn/vader.vim'}
    -- use {'milisims/nvim-luaref'}
    -- use {'tjdevries/nlua.nvim'}
    -- use {'metakirby5/codi.vim'}
    -- use {'bfredl/nvim-luadev'}

    -- Plugin development

    -- Better syntax
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/playground'}
    use {'JoosepAlviste/nvim-ts-context-commentstring'}
    use {
        'romgrk/nvim-treesitter-context',
        config = function()
            require('treesitter-context.config').setup {enable = true}
        end
    }
    use {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({enable = true})
        end
    }
    -- use {
    --     "folke/twilight.nvim",
    --     config = function() require("twilight").setup {} end
    -- }
    -- use {'nvim-treesitter/nvim-treesitter-refactor'}

    -- Dashboard
    use {'glepnir/dashboard-nvim'}
    -- use {'thaerkh/vim-workspace'}

    -- Status line
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require 'statusline' end
    }

    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "both",
                    number_style = "superscript",
                    diagnostics = "nvim_lsp",
                    show_tab_indicators = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false
                }
            })
        end
    }
    -- use { 'romgrk/barbar.nvim' }

    -- Debugging
    use {'puremourning/vimspector'}
    use {'nvim-telescope/telescope-vimspector.nvim'}

    -- DAP
    use {'mfussenegger/nvim-dap'}
    use {'nvim-telescope/telescope-dap.nvim'}
    use {'mfussenegger/nvim-dap-python'} -- Python
    use {'theHamsta/nvim-dap-virtual-text'}
    use {'rcarriga/nvim-dap-ui'}
    use {'Pocco81/DAPInstall.nvim'}
    use {'jbyuki/one-small-step-for-vimkind'}

    -- Project
    use {'nvim-telescope/telescope-project.nvim'}
    use {'airblade/vim-rooter'}
    -- use {'tpope/vim-projectionist'}

    -- Development workflow
    use {'voldikss/vim-browser-search'}
    use {'kkoomen/vim-doge', run = '-> doge#install()'}

    -- use {'jbyuki/instant.nvim'}
    -- use {'chrisbra/unicode.vim'}

    -- Rust
    use {'rust-lang/rust.vim'}
    use {'simrat39/rust-tools.nvim'}

    -- Go
    use {'ray-x/go.nvim', config = function() require('go').setup() end}

    -- Database
    -- use {'tpope/vim-dadbod'}
    -- use {'kristijanhusak/vim-dadbod-ui'}
    -- use {'kristijanhusak/vim-dadbod-completion'}
    -- use {'tpope/vim-dotenv' }

    -- Markdown
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use {'plasticboy/vim-markdown'}
    -- use {'npxbr/glow.nvim', run = ':GlowInstall'}
    -- use {'mzlogin/vim-markdown-toc'}
    -- use {'godlygeek/tabular'}

    -- Development settings
    -- use {'editorconfig/editorconfig-vim'}

    -- Writing and note taking
    use {
        'lewis6991/spellsitter.nvim',
        config = function() require('spellsitter').setup() end
    }
    -- TODO: To try out
    -- use {
    --     "vhyrro/neorg",
    --     config = function()
    --         require('neorg').setup {
    --             -- Tell Neorg what modules to load
    --             load = {
    --                 ["core.defaults"] = {}, -- Load all the default modules
    --                 ["core.norg.concealer"] = {}, -- Allows for use of icons
    --                 ["core.norg.dirman"] = { -- Manage your directories with Neorg
    --                     config = {workspaces = {my_workspace = "~/neorg"}}
    --                 }
    --             }
    --         }
    --     end,
    --     requires = "nvim-lua/plenary.nvim"
    -- }
    use {
        'kristijanhusak/orgmode.nvim',
        config = function()
            require('orgmode').setup {
                org_agenda_files = {'~/workspace/dev/notes/**/*'},
                org_default_notes_file = '~workspace/dev/notes/notes.org'
            }
        end
    }
    -- TODO: try out
    -- use {'Pocco81/HighStr.nvim'}
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
    -- use {'oberblastmeister/neuron.nvim', branch = 'unstable'}

    -- use {'oberblastmeister/neuron.nvim' }
    -- use {'junegunn/fzf', run = '-> fzf#install()' }
    -- use {'junegunn/fzf.vim'}
    -- use {'fiatjaf/neuron.vim' }

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

    -- Latex
    -- use {'lervag/vimtex' }

    -- Neoterm
    -- use {'kassio/neoterm' }

    -- Better terminal
    -- use {'nikvdp/neomux' }

end)
