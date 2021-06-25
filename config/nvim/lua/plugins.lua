return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true }

    -- Development
    use {'tpope/vim-dispatch'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-rhubarb'}
    use {'tpope/vim-unimpaired'}
    use {'tpope/vim-vinegar'}
    use {'tpope/vim-sleuth'}
    use {'tpope/vim-repeat'}
    use {'guns/sexp'}
    use {'tpope/vim-sexp-mappings-for-regular-people'}

    use {'wellle/targets.vim'}
    use {'easymotion/vim-easymotion'}
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
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
    use {'norcalli/nvim-colorizer.lua'}
    -- use {'kevinhwang91/rnvimr'}
    -- use {'francoiscabrol/ranger.vim'}
    use {'lokaltog/neoranger'}
    -- use {'rbgrouleff/bclose.vim'}
    -- use {'christoomey/vim-tmux-navigator'}
    -- use {'mhinz/vim-signify'}
    -- use {'radenling/vim-dispatch-neovim' }
    -- use {'phaazon/hop.nvim'}
    use {'rhysd/reply.vim', cmd = [['Repl', 'ReplAuto']]}
    use {'diepm/vim-rest-console'}
    use {'kosayoda/nvim-lightbulb'}
    -- use {'preservim/tagbar'}
    -- use {'liuchengxu/vista.vim'}
    use {'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps'}

    -- Color
    use {"th3whit3wolf/Dusk-til-Dawn.nvim"}
    use {
        "glepnir/indent-guides.nvim",
        branch = "main"
    }
    use {'kyazdani42/nvim-web-devicons'}
    use {'sainnhe/gruvbox-material'}
    use {'patstockwell/vim-monokai-tasty'}
    use {'tanvirtin/monokai.nvim'}
    use {'NLKNguyen/papercolor-theme'}
    use {'folke/tokyonight.nvim'}
    use {'joshdick/onedark.vim'}
    use {'sainnhe/sonokai'}
    use {'sainnhe/everforest'}
    use {'sainnhe/edge'}

    -- Testing
    -- use {'vim-test/vim-test'}
    -- use { "rcarriga/vim-ultest", run = ":UpdateRemotePlugins" }

    -- Telescope
    -- use {'nvim-lua/plenary.nvim'}
    use {'ludovicchabant/vim-gutentags'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'fhill2/telescope-ultisnips.nvim'}
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
    use {'nvim-telescope/telescope-node-modules.nvim'}
    use {'sudormrfbin/cheatsheet.nvim'}
    use {
        'rmagatti/session-lens',
        requires = {'rmagatti/auto-session'},
        config = function()
            require('session-lens').setup({
                shorten_path = false,
                theme_conf = { border = false },
                previewer = true
            })
        end
    }
    use {'tom-anders/telescope-vim-bookmarks.nvim'}
    use { 'nvim-telescope/telescope-snippets.nvim' }

    -- LSP config
    use {'neovim/nvim-lspconfig'}
    -- use { 'kabouzeid/nvim-lspinstall'}

    -- Completion
    use {'hrsh7th/nvim-compe'}
    use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}
    -- use {'codota/tabnine-vim'}

    -- Better LSP experience
    -- use {'glepnir/lspsaga.nvim'}
    use {'onsails/lspkind-nvim'}
    use {'mortepau/codicons.nvim'}
    use {'sbdchd/neoformat'}
    use {'p00f/nvim-ts-rainbow'}
    use {'ray-x/lsp_signature.nvim'}
    -- use {'szw/vim-maximizer'}
    -- use {'dyng/ctrlsf.vim'}
    -- use {'pechorin/any-jump.vim'}
    use {'kshenoy/vim-signature'}
    -- use {'kevinhwang91/nvim-bqf'}
    -- use {
    --     "folke/trouble.nvim",
    --     requires = "kyazdani42/nvim-web-devicons",
    --     config = function() require("trouble").setup {} end
    -- }
    -- use {'junegunn/vim-peekaboo'}
    -- use {'gennaro-tedesco/nvim-peekup'}
    use {'wellle/context.vim'}
    -- use {'lukas-reineke/indent-blankline.nvim' }
    -- use {'Yggdroot/indentLine' }
    -- use {'beauwilliams/focus.nvim' }
    use {'RRethy/vim-illuminate' }

    -- Snippets
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    -- use {'cstrap/python-snippets'}
    -- use {'ylcnfrht/vscode-python-snippet-pack'}
    use {'xabikos/vscode-javascript'}
    -- use {'golang/vscode-go'}
    -- use {'rust-lang/vscode-rust'}
    use { 'SirVer/ultisnips' }
    use { 'honza/vim-snippets' }
    use { 'norcalli/snippets.nvim' }

    -- Lua development
    use {'folke/lua-dev.nvim'}
    use {'simrat39/symbols-outline.nvim'}
    use {'rafcamlet/nvim-luapad'}
    -- use {'~/workspace/development/alpha2phi/alpha.nvim'}
    -- use {'tjdevries/nlua.nvim'}
    -- use {'metakirby5/codi.vim'}
    -- use {'bfredl/nvim-luadev'}

    -- Plugin development
    -- use {'thinca/vim-themis'}
    -- use {'tpope/vim-scriptease'}
    -- use {'junegunn/vader.vim'}

    -- Clojure Development
    use {'Olical/conjure', tag = 'v4.20.0'}
    use {'dense-analysis/ale'}
    use {'eraserhd/parinfer-rust', run = 'cargo build --release'}
    use {'dmac/vim-cljfmt', run = 'go get github.com/cespare/goclj/cljfmt'}
    use {'clojure-vim/async-clj-omni'}

    -- Better syntax
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- use {'nvim-treesitter/playground'}

    -- UI/UX ... Dashboard, tabline...
    -- use {'glepnir/dashboard-nvim'}
    use {'zefei/vim-wintabs'}
    use {'zefei/vim-wintabs-powerline'}

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
    use {'chrisbra/unicode.vim'}

    -- Rust
    -- use {'rust-lang/rust.vim'}

    -- Database
    -- use {'tpope/vim-dadbod'}
    -- use {'kristijanhusak/vim-dadbod-ui'}
    -- use {'kristijanhusak/vim-dadbod-completion'}
    -- use {'tpope/vim-dotenv' }

    -- Markdown
     use {'npxbr/glow.nvim', run = ':GlowInstall'}
    -- use {'mzlogin/vim-markdown-toc'}
    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    -- use {'godlygeek/tabular'}
    use {'plasticboy/vim-markdown'}

    -- Devluas
    use {'editorconfig/editorconfig-vim'}

    -- Documentation/Help/Bookmarks ...
    use {'sunaku/vim-dasht'}
    use {'MattesGroeger/vim-bookmarks'}

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
    use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup {}
    end
    }
    use {'oberblastmeister/neuron.nvim', branch = 'unstable', run = 'nix-env -if https://github.com/srid/neuron/archive/master.tar.gz' }

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
    use {'metakirby5/codi.vim' }

    -- Slime
    -- use {'jpalardy/vim-slime' }

    -- Latex
    -- use {'lervag/vimtex' }

    -- Neoterm
    -- use {'kassio/neoterm' }

    -- Better terminal
    -- use {'nikvdp/neomux' }

    -- Cheat.sh ... autoreplace answers to worded problem formulations via stackoverflow background searches
    use {'dbeniamine/cheat.sh-vim'}

    -- bufutilities
    use {'smitajit/bufutils.vim'}
    use {'arithran/vim-delete-hidden-buffers'}

    -- timetracking
    -- use {'git-time-metric/gtm-vim-plugin'}
    use {'wakatime/vim-wakatime'}

    -- tmux
    use {'roxma/vim-tmux-clipboard'}
    use {'christoomey/vim-tmux-navigator'}
end,
{ config = { git = { clone_timeout = false } }})

