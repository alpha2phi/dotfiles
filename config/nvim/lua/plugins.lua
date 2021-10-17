local M = {}

function M.setup()
  local packer = require "packer"

  local conf = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  }

  local function plugins(use)
    -- Packer can manage itself as an optional plugin
    use { "wbthomason/packer.nvim", opt = true }

    -- Development
    use { "tpope/vim-dispatch" }
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-surround" }
    use { "tpope/vim-commentary" }
    use { "tpope/vim-rhubarb" }
    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-vinegar" }
    use { "tpope/vim-sleuth" }
    use { "wellle/targets.vim" }
    use { "easymotion/vim-easymotion" }
    use { "lewis6991/impatient.nvim" }
    use {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPre",
      config = function()
        require("gitsigns").setup()
      end,
    }
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      config = function()
        require("config.neogit").setup()
      end,
    }
    use {
      "sindrets/diffview.nvim",
      cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
      },
    }
    use { "unblevable/quick-scope", event = "VimEnter" }
    use { "voldikss/vim-floaterm", event = "VimEnter" }
    use {
      "folke/which-key.nvim",
      config = function()
        require("config.which-key").setup()
      end,
    }
    use {
      "gelguy/wilder.nvim",
      run = ":UpdateRemotePlugins",
      config = function()
        require("config.wilder").setup()
      end,
    }
    -- use {'chrisbra/NrrwRgn'}
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("nvim-tree").setup {}
      end,
    }
    use { "windwp/nvim-spectre", event = "VimEnter" }
    use {
      "ruifm/gitlinker.nvim",
      event = "VimEnter",
      config = function()
        require("gitlinker").setup()
      end,
    }
    use {
      "rmagatti/session-lens",
      requires = { "rmagatti/auto-session" },
      event = "VimEnter",
      config = function()
        require("config.auto-session").setup {}
        require("session-lens").setup {}
      end,
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
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }
    use { "sainnhe/gruvbox-material" }
    use { "NLKNguyen/papercolor-theme" }
    use { "folke/tokyonight.nvim" }
    use { "sainnhe/everforest" }
    use { "folke/lsp-colors.nvim" }
    use { "navarasu/onedark.nvim" }

    -- Testing
    use {
      "rcarriga/vim-ultest",
      config = "require('config.test').setup()",
      run = ":UpdateRemotePlugins",
      requires = { "vim-test/vim-test" },
    }

    -- Telescope
    use { "nvim-lua/plenary.nvim" }
    use { "nvim-lua/popup.nvim" }
    use {
      "nvim-telescope/telescope.nvim",
      cmd = { "Telescope" },
      module = "telescope",
      requires = {
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        -- 'nvim-telescope/telescope-github.nvim',
        -- 'nvim-telescope/telescope-hop.nvim'
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        {
          "nvim-telescope/telescope-arecibo.nvim",
          rocks = { "openssl", "lua-http-parser" },
        },
        {
          "nvim-telescope/telescope-frecency.nvim",
          requires = { "tami5/sql.nvim" },
        },
        {
          "nvim-telescope/telescope-vimspector.nvim",
          event = "BufWinEnter",
        },
        { "nvim-telescope/telescope-dap.nvim" },
      },
      config = function()
        require("config.telescope").setup()
      end,
    }
    use {
      "ahmedkhalf/project.nvim",
      event = "VimEnter",
      config = function()
        require("project_nvim").setup {}
      end,
    }
    -- use {'airblade/vim-rooter'}

    -- LSP config
    use { "williamboman/nvim-lsp-installer" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use {
      "tamago324/nlsp-settings.nvim",
      event = "BufReadPre",
      config = function()
        require("config.nlsp-settings").setup()
      end,
    }
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufReadPre",
      config = function()
        require("config.lsp").setup()
        require("config.dap").setup()
      end,
    }

    -- Completion - use either one of this
    use {
      "hrsh7th/nvim-cmp",
      event = "BufRead",
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
        "ray-x/cmp-treesitter",
      },
      config = function()
        require("config.cmp").setup()
      end,
    }
    -- use {
    --   "tzachar/cmp-tabnine",
    --   run = "./install.sh",
    --   requires = "hrsh7th/nvim-cmp",
    -- }
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
      "glepnir/lspsaga.nvim",
      config = function()
        require("config.lspsaga").setup()
      end,
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init()
      end,
    }
    use { "sbdchd/neoformat" }
    use { "ray-x/lsp_signature.nvim" }
    use { "szw/vim-maximizer" }
    -- use {'dbeniamine/cheat.sh-vim'}
    -- use {'dyng/ctrlsf.vim'}
    -- use {'pechorin/any-jump.vim'}
    use { "kshenoy/vim-signature" }
    use { "kevinhwang91/nvim-bqf" }
    use { "andymass/vim-matchup", event = "CursorMoved" }
    use {
      "folke/trouble.nvim",
      event = "VimEnter",
      cmd = { "TroubleToggle", "Trouble" },
      config = function()
        require("trouble").setup { auto_open = false }
      end,
    }
    use {
      "folke/todo-comments.nvim",
      cmd = { "TodoTrouble", "TodoTelescope" },
      event = "BufReadPost",
      config = function()
        require("todo-comments").setup {}
      end,
    }
    use {
      "nacro90/numb.nvim",
      config = function()
        require("numb").setup()
      end,
    }
    use { "junegunn/vim-easy-align" }
    use { "antoinemadec/FixCursorHold.nvim" }

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
      "SirVer/ultisnips",
      requires = { "honza/vim-snippets" },
      event = "VimEnter",
      config = function()
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end,
    }
    -- Lua development
    use { "folke/lua-dev.nvim", event = "VimEnter" }
    use {
      "simrat39/symbols-outline.nvim",
      event = "VimEnter",
      config = function()
        require("config.symbols-outline").setup()
      end,
    }
    use { "~/workspace/dev/alpha2phi/alpha.nvim" }

    -- Better syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "jose-elias-alvarez/nvim-lsp-ts-utils", event = "BufRead" },
        { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
        { "p00f/nvim-ts-rainbow", event = "BufRead" },
        {
          "nvim-treesitter/playground",
          cmd = "TSHighlightCapturesUnderCursor",
          event = "BufRead",
        },
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
          event = "BufRead",
        },
        { "RRethy/nvim-treesitter-textsubjects", event = "BufRead" },
        {
          "windwp/nvim-autopairs",
          event = "BufRead",
          run = "make",
          config = function()
            require("nvim-autopairs").setup {}
          end,
        },
        {
          "windwp/nvim-ts-autotag",
          event = "BufRead",
          config = function()
            require("nvim-ts-autotag").setup { enable = true }
          end,
        },
        {
          "romgrk/nvim-treesitter-context",
          event = "BufRead",
          config = function()
            require("treesitter-context.config").setup { enable = true }
          end,
        },
        {
          "mfussenegger/nvim-ts-hint-textobject",
          event = "BufRead",
          config = function()
            vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
            vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
          end,
        },
      },
    }

    -- Dashboard
    use {
      "glepnir/dashboard-nvim",
      config = function()
        require("config.dashboard").setup()
      end,
    }

    -- use {
    --   "goolord/alpha-nvim",
    --   requires = { "kyazdani42/nvim-web-devicons" },
    --   config = function()
    --     require("alpha").setup(require("alpha.themes.dashboard").opts)
    --   end,
    -- }

    -- Status line
    -- use {
    --   "famiu/feline.nvim",
    --   config = function()
    --     require("config.feline").setup()
    --   end,
    -- }
    -- use {
    --   "glepnir/galaxyline.nvim",
    --   branch = "main",
    --   config = function()
    --     require("config.galaxyline").setup()
    --   end,
    -- }
    use {
      "hoob3rt/lualine.nvim",
      event = "VimEnter",
      config = function()
        require("config.lualine").setup()
      end,
    }

    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require("config.bufferline").setup()
      end,
      event = "BufReadPre",
    }

    -- Debugging
    use { "puremourning/vimspector", event = "BufWinEnter" }

    -- DAP
    use { "mfussenegger/nvim-dap" }
    use { "mfussenegger/nvim-dap-python" }
    use { "theHamsta/nvim-dap-virtual-text" }
    use { "rcarriga/nvim-dap-ui" }
    use { "Pocco81/DAPInstall.nvim" }
    use { "jbyuki/one-small-step-for-vimkind" }

    -- Development workflow
    use { "voldikss/vim-browser-search", event = "VimEnter" }
    use { "tyru/open-browser.vim", event = "VimEnter" }
    use {
      "kkoomen/vim-doge",
      run = ":call doge#install()",
      config = function()
        require("config.doge").setup()
      end,
      event = "VimEnter",
    }
    use {
      "michaelb/sniprun",
      run = "bash install.sh",
      config = function()
        require("config.sniprun").setup()
      end,
    }

    -- Rust
    use { "rust-lang/rust.vim", event = "VimEnter" }
    use { "simrat39/rust-tools.nvim" }
    use {
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      config = function()
        require("crates").setup()
      end,
    }

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      ft = "markdown",
      cmd = { "MarkdownPreview" },
    }
    use {
      "plasticboy/vim-markdown",
      ft = "markdown",
      requires = { "godlygeek/tabular" },
      event = "VimEnter",
    }

    -- Note taking
    use {
      "vhyrro/neorg",
      event = "VimEnter",
      config = function()
        require("config.neorg").setup()
      end,
    }
    use {
      "stevearc/gkeep.nvim",
      event = "VimEnter",
      run = ":UpdateRemotePlugins",
    }

    use { "rhysd/vim-grammarous", ft = { "markdown" } }

    use {
      "folke/zen-mode.nvim",
      cmd = "ZenMode",
      config = function()
        require("zen-mode").setup {}
      end,
    }

    -- Trying

    use { "sindrets/winshift.nvim" }

    use { "untitled-ai/jupyter_ascending.vim" }

    use {
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function()
        vim.notify = require "notify"
      end,
    }

    use {
      "max397574/better-escape.nvim",
      config = function()
        require("better_escape").setup()
      end,
      event = "InsertEnter",
    }

    use {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
      config = [[vim.g.startuptime_tries = 10]],
    }

    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }
  end

  packer.init(conf)
  packer.startup(plugins)
end

return M

------------------ Plugins list ----------------------

-- use { "Pocco81/Catppuccino.nvim" }

-- use {
--   "dccsillag/magma-nvim",
--   run = ":UpdateRemotePlugins",
-- }

-- use {
--   "weilbith/nvim-code-action-menu",
--   cmd = "CodeActionMenu",
-- }

-- use { "jdhao/better-escape.vim", event = "InsertEnter" }

-- Go
-- use {'ray-x/go.nvim', config = function() require('go').setup() end}

-- use { "jamestthompson3/nvim-remote-containers" }

-- use {
--     'kristijanhusak/orgmode.nvim',
--     config = function()
--         require('orgmode').setup {
--             org_agenda_files = {'~/workspace/dev/notes/**/*'},
--             org_default_notes_file = '~workspace/dev/notes/notes.org'
--         }
--     end
-- }

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
