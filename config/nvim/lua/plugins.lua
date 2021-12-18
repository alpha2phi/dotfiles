local M = {}

local packer_bootstrap = false

local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
  end
  vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"
end

packer_init()

function M.setup()
  local conf = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  }

  local function plugins(use)
    use {
      "lewis6991/impatient.nvim",
      config = function()
        require "impatient"
      end,
    }

    use { "wbthomason/packer.nvim" }

    -- Development
    use { "tpope/vim-dispatch" }
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-surround" }
    -- use { "tpope/vim-commentary" }
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup {
          mappings = { extra = true },
        }
      end,
    }
    use { "tpope/vim-rhubarb" }
    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-vinegar" }
    use { "tpope/vim-sleuth" }
    use { "wellle/targets.vim" }
    use { "easymotion/vim-easymotion" }
    -- use { "ggandor/lightspeed.nvim" }
    use {
      "lewis6991/gitsigns.nvim",
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
        require("config.whichkey").setup()
      end,
    }
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
    use { "google/vim-searchindex" }
    use {
      "rmagatti/session-lens",
      requires = { "rmagatti/auto-session" },
      config = function()
        require("config.auto-session").setup()
        require("session-lens").setup {}
      end,
    }

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
      requires = {
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-telescope/telescope-github.nvim",
        "fhill2/telescope-ultisnips.nvim",
        "cljoly/telescope-repo.nvim",
        "jvgrootveld/telescope-zoxide",
        "dhruvmanila/telescope-bookmarks.nvim",
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

    -- Project settings
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
    -- use {
    --   "tamago324/nlsp-settings.nvim",
    --   -- event = "BufReadPre",
    --   config = function()
    --     require("config.nlsp-settings").setup()
    --   end,
    -- }
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("config.lsp").setup()
        require("config.dap").setup()
      end,
    }

    -- Completion - use either one of this
    use {
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
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
      },
      config = function()
        require("config.cmp").setup()
      end,
    }
    use {
      "tami5/lspsaga.nvim",
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
    use {
      "SirVer/ultisnips",
      requires = { { "honza/vim-snippets", rtp = "." }, "mlaursen/vim-react-snippets" },
      config = function()
        vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
        vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
        vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
        vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
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

    -- Better syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "jose-elias-alvarez/nvim-lsp-ts-utils" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "p00f/nvim-ts-rainbow" },
        {
          "nvim-treesitter/playground",
          cmd = "TSHighlightCapturesUnderCursor",
        },
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
        },
        { "RRethy/nvim-treesitter-textsubjects" },
        {
          "windwp/nvim-autopairs",
          run = "make",
          config = function()
            require("nvim-autopairs").setup {}
          end,
        },
        {
          "windwp/nvim-ts-autotag",
          config = function()
            require("nvim-ts-autotag").setup { enable = true }
          end,
        },
        {
          "romgrk/nvim-treesitter-context",
          config = function()
            require("treesitter-context.config").setup { enable = true }
          end,
        },
        {
          "mfussenegger/nvim-ts-hint-textobject",
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

    use {
      "nvim-lualine/lualine.nvim",
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

    use {
      "SmiteshP/nvim-gps",
      config = function()
        require("nvim-gps").setup()
      end,
    }

    -- Debugging
    use { "puremourning/vimspector", event = "BufWinEnter" }

    -- DAP
    use { "mfussenegger/nvim-dap" }
    use { "mfussenegger/nvim-dap-python" }
    use {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup {}
      end,
    }
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
    use {
      "simrat39/rust-tools.nvim",
      config = function()
        require("rust-tools").setup {}
      end,
    }
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
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {}
      end,
    }

    -- Database
    use {
      "tpope/vim-dadbod",
      requires = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion" },
      config = function()
        require("config.dadbod").setup()
      end,
    }

    -- Web
    use {
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
      config = function()
        require("package-info").setup()
      end,
    }

    -- AI completion
    use { "github/copilot.vim" }

    -- Notifications
    use {
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require "notify"
      end,
    }

    -- Better configuration
    use {
      "max397574/better-escape.nvim",
      config = function()
        require("better_escape").setup()
      end,
    }

    use { "nathom/filetype.nvim" }

    -- Performance
    use { "tweekmonster/startuptime.vim" }

    -- Clipboard
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }

    -- Trying
    use {
      "tanvirtin/vgit.nvim",
      event = "BufWinEnter",
      config = function()
        require("vgit").setup()
      end,
    }

    use {
      "hrsh7th/vim-vsnip",
      requires = {
        "rafamadriz/friendly-snippets",
        "cstrap/python-snippets",
        "ylcnfrht/vscode-python-snippet-pack",
        "xabikos/vscode-javascript",
        "golang/vscode-go",
        "rust-lang/vscode-rust",
      },
    }
    use { "hrsh7th/cmp-vsnip" }

    -- use {"haringsrob/nvim_context_vt"}

    if packer_bootstrap then
      print "Setting up Neovim. Restart required after installation!"
      require("packer").sync()
    end
  end

  require("packer").init(conf)
  require("packer").startup(plugins)

  local ok_packer, _ = pcall(require, "packer_compiled")
  if not ok_packer then
    print "Could not load packer_compiled.lua"
  end
end

return M

------------------ Plugins list ----------------------

-- use {'dbeniamine/cheat.sh-vim'}
-- use {'dyng/ctrlsf.vim'}
-- use {'pechorin/any-jump.vim'}
-- use {
--   "gelguy/wilder.nvim",
--   run = ":UpdateRemotePlugins",
--   config = function()
--     require("config.wilder").setup()
--   end,
-- }
-- use {'chrisbra/NrrwRgn'}
-- use { "tzachar/cmp-tabnine", run = "./install.sh" }
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
-- use { "~/workspace/dev/alpha2phi/alpha.nvim" }
-- use { "~/workspace/alpha2phi/learn-nvim", requires = { "nvim-lua/plenary.nvim" } }
-- use { "~/workspace/alpha2phi/cmp-openai-codex", requires = { "nvim-lua/plenary.nvim" } }
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

-- use {
--     'ojroques/nvim-lspfuzzy',
--     requires = {
--         {'junegunn/fzf'}, {'junegunn/fzf.vim'} -- to enable preview (optional)
--     },
--     config = function() require('lspfuzzy').setup {} end
-- }
-- use {'liuchengxu/vista.vim'}
-- use {
--   "dstein64/vim-startuptime",
--   cmd = "StartupTime",
--   config = [[vim.g.startuptime_tries = 10]],
-- }

-- use { "stevearc/dressing.nvim" }

-- use {
--   "code-biscuits/nvim-biscuits",
--   config = function()
--     require("nvim-biscuits").setup {}
--   end,
-- }

-- use { "preservim/vimux" }
-- use { "camgraff/telescope-tmux.nvim", requires = { "norcalli/nvim-terminal.lua" } }

-- use {
--   "pwntester/octo.nvim",
--   config = function()
--     require("octo").setup()
--   end,
-- }

-- use { "mfussenegger/nvim-lint" }  -- try this with vale
-- use { "ThePrimeagen/harpoon" }

-- use { "christoomey/vim-quicklink", requires = { "mattn/webapi-vim" } }
-- if executable "deno" then
--   use { "vim-denops/denops.vim" }
--   use {
--     "Shougo/ddc.vim",
--     requires = {
--       "Shougo/ddc-around",
--       "Shougo/ddc-nvim-lsp",
--     },
--   }
-- end

-- local executable = function(x)
--   return vim.fn.executable(x) == 1
-- end

-- use { "sudormrfbin/cheatsheet.nvim" }

-- use { "sindrets/winshift.nvim" }

-- use { "RishabhRD/nvim-cheat.sh", requires = { "RishabhRD/popfix" } }-- use { "RishabhRD/nvim-cheat.sh", requires = { "RishabhRD/popfix" } }-- use { "RishabhRD/nvim-cheat.sh", requires = { "RishabhRD/popfix" } }

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
