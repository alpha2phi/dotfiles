return require('packer').startup(function()

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
    use {'wellle/targets.vim'}
    use {'easymotion/vim-easymotion'}
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        'TimUntersberger/neogit',
        config = function() require('neogit').setup() end
    }
    use {'unblevable/quick-scope'}
    use {'voldikss/vim-floaterm'}
    use {'jiangmiao/auto-pairs'}
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup {} end
    }
    -- use {'liuchengxu/vim-which-key'}
    -- use {'norcalli/nvim-colorizer.lua'}
    -- use {'kevinhwang91/rnvimr'}
    -- use {'francoiscabrol/ranger.vim'}
    -- use {'rbgrouleff/bclose.vim'}
    -- use {'christoomey/vim-tmux-navigator'}
    -- use {'mhinz/vim-signify'}
    -- use {'radenling/vim-dispatch-neovim' }
    -- use {'phaazon/hop.nvim'}

    -- Color scheme
    use {'kyazdani42/nvim-web-devicons'}
    use {'sainnhe/gruvbox-material'}
    use {'folke/tokyonight.nvim'}
    -- use {'joshdick/onedark.vim'}

    -- Testing
    use {'vim-test/vim-test'}
    -- use { "rcarriga/vim-ultest", run = ":UpdateRemotePlugins" }

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
    -- use {
    --     'nvim-telescope/telescope-arecibo.nvim',
    --     rocks = {"openssl", "lua-http-parser"}
    -- }
    -- use { 'nvim-telescope/telescope-media-files.nvim' }
    -- use { 'nvim-telescope/telescope-packer.nvim ' }

    -- LSP config
    use {'neovim/nvim-lspconfig'}
    -- use { 'kabouzeid/nvim-lspinstall'}

    -- Completion - use either one of this
    use {'hrsh7th/nvim-compe'}
    -- use { 'nvim-lua/completion-nvim' }

    -- Better LSP experience
    use {'glepnir/lspsaga.nvim'}
    use {'onsails/lspkind-nvim'}
    use {'sbdchd/neoformat'}
    use {'p00f/nvim-ts-rainbow'}
    use {'ray-x/lsp_signature.nvim'}
    use {'szw/vim-maximizer'}
    use {'dyng/ctrlsf.vim'}
    use {'dbeniamine/cheat.sh-vim'}
    use {'kevinhwang91/nvim-bqf'}
    use {'pechorin/any-jump.vim'}
    -- use {
    --     "folke/trouble.nvim",
    --     requires = "kyazdani42/nvim-web-devicons",
    --     config = function() require("trouble").setup {} end
    -- }
    -- use {'junegunn/vim-peekaboo'}
    -- use {'gennaro-tedesco/nvim-peekup'}
    -- use {'wellle/context.vim'}
    -- use {'lukas-reineke/indent-blankline.nvim' }
    -- use {'Yggdroot/indentLine' }
    -- use {'beauwilliams/focus.nvim' }
    -- use {'RRethy/vim-illuminate' }
    -- use {'kosayoda/nvim-lightbulb' }

    -- Snippets
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    use {'cstrap/python-snippets'}
    use {'ylcnfrht/vscode-python-snippet-pack'}
    use {'xabikos/vscode-javascript'}
    use {'golang/vscode-go'}
    use {'rust-lang/vscode-rust'}
    -- use { 'honza/vim-snippets' }
    -- use { 'SirVer/ultisnips' }
    -- use { 'norcalli/snippets.nvim' }
    -- use { 'nvim-telescope/telescope-snippets.nvim' }

    -- Lua development
    use {'folke/lua-dev.nvim'}
    use {'simrat39/symbols-outline.nvim'}
    use {'rafcamlet/nvim-luapad'}
    -- use {'tjdevries/nlua.nvim'}
    -- use {'metakirby5/codi.vim'}
    -- use {'bfredl/nvim-luadev'}

    -- Plugin development
    use {'thinca/vim-themis'}
    use {'tpope/vim-scriptease'}
    use {'junegunn/vader.vim'}

    -- Better syntax
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- use {'nvim-treesitter/playground'}

    -- Dashboard
    use {'glepnir/dashboard-nvim'}

    -- Status line
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require 'statusline' end
    }
    -- use { 'romgrk/barbar.nvim' }

    -- Debugging
    use {'puremourning/vimspector'}
    use {'nvim-telescope/telescope-vimspector.nvim'}

    -- Telescope fzf
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- Project
    use {'nvim-telescope/telescope-project.nvim'}
    use {'airblade/vim-rooter'}
    -- use {'tpope/vim-projectionist'}

    -- Development workflow
    use {'voldikss/vim-browser-search'}
    use {'kkoomen/vim-doge', run = '-> doge#install()'}

    -- Rust
    use {'rust-lang/rust.vim'}

    -- Database
    -- use {'tpope/vim-dadbod'}
    -- use {'kristijanhusak/vim-dadbod-ui'}
    -- use {'kristijanhusak/vim-dadbod-completion'}
    -- use {'tpope/vim-dotenv' }

    -- Markdown
    -- use {'npxbr/glow.nvim', run = ':GlowInstall'}
    -- use {'mzlogin/vim-markdown-toc'}
    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    -- use {'godlygeek/tabular'}
    -- use {'plasticboy/vim-markdown'}

    -- Development settings
    -- use {'editorconfig/editorconfig-vim'}

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

    -- -- DAP
    -- use {'mfussenegger/nvim-dap' }
    -- use {'nvim-telescope/telescope-dap.nvim' }
    -- use {'mfussenegger/nvim-dap-python' } -- Python

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

