local M = {}

function M.setup()

    local packer = require("packer")

    -- local util = require "packer.util"
    -- packer.init({
    --     compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua',
    --                                    'packer_compiled.lua')
    -- })

    packer.startup(function(use)

        -- Packer can manage itself as an optional plugin
        use {'wbthomason/packer.nvim', opt = true}

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
        use {'easymotion/vim-easymotion'}
        use {
            'lewis6991/gitsigns.nvim',
            config = function() require('gitsigns').setup() end
        }
        use {
            'TimUntersberger/neogit',
            config = function() require("config.neogit").setup() end
        }
        use {'sindrets/diffview.nvim'}
        use {'unblevable/quick-scope'}
        use {'voldikss/vim-floaterm'}
        use {
            'folke/which-key.nvim',
            config = function() require("config.which-key").setup() end
        }
        -- use {'chrisbra/NrrwRgn'}
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons'
        }
        use {'windwp/nvim-spectre'}
        use {
            'ruifm/gitlinker.nvim',
            config = function() require("gitlinker").setup() end
        }
        use {
            'rmagatti/auto-session',
            config = function()
                require("config.auto-session").setup({})
            end
        }
        use {
            'windwp/nvim-autopairs',
            run = 'make',
            config = function() require('nvim-autopairs').setup {} end
        }
        -- use {
        --     'ojroques/nvim-lspfuzzy',
        --     requires = {
        --         {'junegunn/fzf'}, {'junegunn/fzf.vim'} -- to enable preview (optional)
        --     },
        --     config = function() require('lspfuzzy').setup {} end
        -- }
        -- use {'liuchengxu/vista.vim'}

        -- Color scheme
        use {
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup({default = true})
            end
        }
        use {'sainnhe/gruvbox-material'}
        use {'NLKNguyen/papercolor-theme'}
        use {'folke/tokyonight.nvim'}
        use {'sainnhe/everforest'}
        use {'folke/lsp-colors.nvim'}

        -- Testing
        use {
            "rcarriga/vim-ultest",
            config = "require('config.test').setup()",
            run = ":UpdateRemotePlugins",
            requires = {"vim-test/vim-test"}
        }

        -- Telescope
        use {'nvim-lua/plenary.nvim'}
        use {'nvim-lua/popup.nvim'}
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-telescope/telescope-project.nvim',
                'nvim-telescope/telescope-symbols.nvim'
                -- 'nvim-telescope/telescope-github.nvim',
                -- 'nvim-telescope/telescope-hop.nvim'
            },
            config = function() require("config.telescope").setup() end
        }
        use {
            'nvim-telescope/telescope-frecency.nvim',
            requires = {'tami5/sql.nvim'},
            config = function()
                require('telescope').load_extension('frecency')
            end
        }
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        use {
            "ahmedkhalf/project.nvim",
            config = function() require("project_nvim").setup {} end
        }
        -- use {'airblade/vim-rooter'}

        -- LSP config
        use {'neovim/nvim-lspconfig'}
        use {'kabouzeid/nvim-lspinstall'}
        -- use {
        --     'tamago324/nlsp-settings.nvim',
        --     config = function()
        --         require("config.nlsp-settings").setup()
        --     end
        -- }

        -- Completion - use either one of this
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
                'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
                'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
                'f3fora/cmp-spell', 'hrsh7th/cmp-emoji', 'ray-x/cmp-treesitter'
            },
            config = function() require('config.cmp').setup() end
        }
        use {
            'tzachar/cmp-tabnine',
            run = './install.sh',
            requires = 'hrsh7th/nvim-cmp'
        }
        -- use {'hrsh7th/nvim-compe'}
        -- use {
        --     'ms-jpq/coq_nvim',
        --     branch = 'coq',
        --     event = "VimEnter",
        --     config = 'vim.cmd[[COQnow]]'
        -- }
        -- use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
        -- use { 'nvim-lua/completion-nvim' }

        -- Better LSP experience
        -- use {'tjdevries/astronauta.nvim'}
        use {
            'glepnir/lspsaga.nvim',
            config = function() require("config.lspsaga").setup() end
        }
        use {
            'onsails/lspkind-nvim',
            config = function() require('lspkind').init() end
        }
        use {'sbdchd/neoformat'}
        use {'p00f/nvim-ts-rainbow'}
        use {'ray-x/lsp_signature.nvim'}
        use {'szw/vim-maximizer'}
        -- use {'dbeniamine/cheat.sh-vim'}
        -- use {'dyng/ctrlsf.vim'}
        -- use {'pechorin/any-jump.vim'}
        use {'kshenoy/vim-signature'}
        use {'kevinhwang91/nvim-bqf'}
        use {'andymass/vim-matchup'}
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
            'nacro90/numb.nvim',
            config = function() require('numb').setup() end
        }
        use {'junegunn/vim-easy-align'}
        use {'antoinemadec/FixCursorHold.nvim'}
        use {
            'jose-elias-alvarez/null-ls.nvim',
            requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
        }

        -- Snippets
        -- use {
        --     'hrsh7th/vim-vsnip',
        --     requires = {
        --         'rafamadriz/friendly-snippets', 'cstrap/python-snippets',
        --         'ylcnfrht/vscode-python-snippet-pack', 'xabikos/vscode-javascript',
        --         'golang/vscode-go', 'rust-lang/vscode-rust'
        --     }
        -- }
        use {
            'SirVer/ultisnips',
            requires = {"honza/vim-snippets"},
            config = function()
                vim.g.UltiSnipsRemoveSelectModeMappings = 0
            end
        }
        -- Lua development
        use {'folke/lua-dev.nvim'}
        use {
            'simrat39/symbols-outline.nvim',
            config = function()
                require("config.symbols-outline").setup()
            end
        }
        use {'~/workspace/dev/alpha2phi/alpha.nvim'}

        -- Better syntax
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function() require('config.treesitter').setup() end

        }
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

        -- Dashboard
        use {
            'glepnir/dashboard-nvim',
            config = function() require("config.dashboard").setup() end
        }

        -- Status line
        use {
            'glepnir/galaxyline.nvim',
            branch = 'main',
            config = function() require("config.galaxyline").setup() end
        }
        -- use {
        --     'hoob3rt/lualine.nvim',
        --     requires = {
        --         'kyazdani42/nvim-web-devicons',
        --         config = function() require("config.lualine") end,
        --         opt = true
        --     }
        -- }

        use {
            'akinsho/nvim-bufferline.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require("config.bufferline").setup() end
        }

        -- Debugging
        use {
            'puremourning/vimspector',
            config = function() require("config.vimspector").setup() end
        }
        use {'nvim-telescope/telescope-vimspector.nvim'}

        -- DAP
        use {'mfussenegger/nvim-dap'}
        use {'nvim-telescope/telescope-dap.nvim'}
        use {'mfussenegger/nvim-dap-python'}
        use {'theHamsta/nvim-dap-virtual-text'}
        use {'rcarriga/nvim-dap-ui'}
        use {'Pocco81/DAPInstall.nvim'}
        use {'jbyuki/one-small-step-for-vimkind'}

        -- Development workflow
        use {'voldikss/vim-browser-search'}
        use {
            'kkoomen/vim-doge',
            run = ':call doge#install()',
            config = function() require("config.doge").setup() end
        }

        -- Rust
        use {'rust-lang/rust.vim'}
        use {'simrat39/rust-tools.nvim'}

        -- Markdown
        use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
        use {'plasticboy/vim-markdown'}

        -- TODO: trying

        -- Go
        -- use {'ray-x/go.nvim', config = function() require('go').setup() end}

        -- use {
        --     "rcarriga/nvim-notify",
        --     config = function() vim.notify = require("notify") end
        -- }

        -- use {
        --     'dccsillag/magma-nvim',
        --     run = ':UpdateRemotePlugins',
        --     config = function() require("config.magma").setup() end
        -- }

        -- use {
        --     'kristijanhusak/orgmode.nvim',
        --     config = function()
        --         require('orgmode').setup {
        --             org_agenda_files = {'~/workspace/dev/notes/**/*'},
        --             org_default_notes_file = '~workspace/dev/notes/notes.org'
        --         }
        --     end
        -- }
    end)
end

return M

------------------ Plugins list ----------------------
-- use {
--     "folke/persistence.nvim",
--     event = "BufReadPre",
--     module = "persistence",
--     config = function()
--         require("persistence").setup()
--         require("config.persistence")
--     end
-- }

-- use {'jupyter-vim/jupyter-vim'}
-- use {'svermeulen/vim-yoink'}
-- use {
--     'ray-x/navigator.lua',
--     requires = {
--         'ray-x/guihua.lua',
--         run = 'cd lua/fzy && make',
--         config = function() require'navigator'.setup() end
--     }
-- }

-- Writing and note taking
-- use {
--     "vhyrro/neorg",
--     config = function()
--         require('neorg').setup {
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

-- use {
--     'dstein64/vim-startuptime',
--     cmd = 'StartupTime',
--     config = [[vim.g.startuptime_tries = 10]]
-- }

-- use {
--     'edluffy/specs.nvim',
--     config = function() require('specs').setup {} end
-- }

-- use {'phaazon/hop.nvim'}
-- use {'ggandor/lightspeed.nvim'}

-- use {'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps'}
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

-- use {'thaerkh/vim-workspace'}

-- use {'sainnhe/edge'}
-- use {'joshdick/onedark.vim'}

-- use {'camspiers/snap'}
-- use {
--     'nvim-telescope/telescope-arecibo.nvim',
--     rocks = {"openssl", "lua-http-parser"}
-- }
-- use { 'nvim-telescope/telescope-media-files.nvim' }
-- use { 'nvim-telescope/telescope-packer.nvim ' }

-- use {
--     'lewis6991/spellsitter.nvim',
--     config = function() require('spellsitter').setup() end
-- }

-- use {'npxbr/glow.nvim', run = ':GlowInstall'}
-- use {'mzlogin/vim-markdown-toc'}
-- use {'godlygeek/tabular'}

-- Development settings
-- use {'editorconfig/editorconfig-vim'}

-- Database
-- use {'tpope/vim-dadbod'}
-- use {'kristijanhusak/vim-dadbod-ui'}
-- use {'kristijanhusak/vim-dadbod-completion'}
-- use {'tpope/vim-dotenv' }

-- use {'tpope/vim-projectionist'}

-- use {'jbyuki/instant.nvim'}
-- use {'chrisbra/unicode.vim'}

-- use { 'romgrk/barbar.nvim' }

-- use {
--     'ThePrimeagen/refactoring.nvim',
--     config = function() require("config.refactoring") end
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

-- Plugin development
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

-- use {
--     "folke/twilight.nvim",
--     config = function() require("twilight").setup {} end
-- }
-- use {'nvim-treesitter/nvim-treesitter-refactor'}

-- Snippets
-- use {'L3MON4D3/LuaSnip'}
-- use {
--     'norcalli/snippets.nvim',
--     config = function() require("config.snippets") end
-- }
-- use {'nvim-telescope/telescope-snippets.nvim'}
