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
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

packer_init()

function M.setup()
  local conf = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  local function plugins(use)
    use { "lewis6991/impatient.nvim" }

    use { "wbthomason/packer.nvim" }

    -- Development
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-surround" }
    use { "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } }
    use {
      "numToStr/Comment.nvim",
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("config.comment").setup()
      end,
    }
    use { "tpope/vim-rhubarb" }
    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-vinegar" }
    use { "tpope/vim-sleuth" }
    use { "wellle/targets.vim" }
    use { "easymotion/vim-easymotion" }
    use {
      "lewis6991/gitsigns.nvim",
      -- event = "BufReadPre",
      -- wants = "plenary.nvim",
      -- requires = { "nvim-lua/plenary.nvim" },
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
    use { "rhysd/git-messenger.vim" }
    -- use {
    --   "tanvirtin/vgit.nvim",
    --   event = "BufWinEnter",
    --   config = function()
    --     require("vgit").setup()
    --   end,
    -- }
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
      -- "folke/which-key.nvim", -- TODO: fix
      "zeertzjq/which-key.nvim",
      branch = "patch-1",
      config = function()
        require("config.whichkey").setup()
      end,
    }
    use {
      "kyazdani42/nvim-tree.lua",
      event = "BufWinEnter",
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
    use {
      "sainnhe/gruvbox-material",
      config = function()
        vim.cmd "colorscheme gruvbox-material"
      end,
    }
    use { "sainnhe/everforest", opt = true }
    use { "projekt0n/github-nvim-theme", opt = true }
    -- use { "sainnhe/edge" },
    -- use { "sainnhe/sonokai" }
    -- use { "folke/tokyonight.nvim" }
    -- use {
    --   "catppuccin/nvim",
    --   as = "catppuccin",
    --   config = function()
    --     require("catppuccin").setup {}
    --   end,
    -- }
    -- use { "EdenEast/nightfox.nvim" }
    -- use { "rebelot/kanagawa.nvim" }
    -- use { "mhartington/oceanic-next" }
    -- use { "bluz71/vim-nightfly-guicolors" }
    -- use { "dracula/vim" }
    -- use { "marko-cerovac/material.nvim" }
    -- use { "fenetikm/falcon" }
    -- use { "shaunsingh/nord.nvim" }
    -- use { "folke/lsp-colors.nvim" }
    -- use { "NLKNguyen/papercolor-theme" }
    -- use { "navarasu/onedark.nvim" }

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
      module = "telescope",
      as = "telescope",
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
        require("config.project").setup()
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
      as = "nvim-lspconfig",
      after = "nvim-treesitter",
      opt = true,
      config = function()
        require("config.lsp").setup()
        require("config.dap").setup()
      end,
    }

    -- Completion - use either one of this
    use {
      "hrsh7th/nvim-cmp",
      after = "nvim-treesitter",
      opt = true,
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
    use { "sbdchd/neoformat", event = "BufWinEnter" }
    use { "szw/vim-maximizer", event = "BufWinEnter" }
    use { "kshenoy/vim-signature", event = "BufWinEnter" }
    use { "kevinhwang91/nvim-bqf", event = "BufWinEnter" }
    use { "andymass/vim-matchup", event = "CursorMoved" }
    use { "ray-x/lsp_signature.nvim" }
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
      event = "VimEnter",
      config = function()
        require("numb").setup()
      end,
    }
    use { "junegunn/vim-easy-align", event = "BufReadPost" }
    use { "antoinemadec/FixCursorHold.nvim", event = "BufReadPost" }

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
      disable = true, -- TODO: fix
    }

    -- Better syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      as = "nvim-treesitter",
      event = "BufRead",
      opt = true,
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
    -- use {
    --   "glepnir/dashboard-nvim",
    --   config = function()
    --     require("config.dashboard").setup()
    --   end,
    -- }
    -- use { "mhinz/vim-startify" }
    -- use {
    --   "startup-nvim/startup.nvim",
    --   config = function()
    --     require("startup").setup { theme = "evil" }
    --   end,
    -- }
    -- use {
    --   "echasnovski/mini.nvim",
    --   config = function()
    --     local starter = require "mini.starter"
    --     starter.setup {
    --       items = {
    --         starter.sections.telescope(),
    --       },
    --       content_hooks = {
    --         starter.gen_hook.adding_bullet(),
    --         starter.gen_hook.aligning("center", "center"),
    --       },
    --     }
    --   end,
    -- }
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    use {
      "nvim-lualine/lualine.nvim",
      after = "nvim-treesitter",
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
      module = "nvim-gps",
      config = function()
        require("nvim-gps").setup()
      end,
    }

    -- Debugging
    use { "puremourning/vimspector", event = "BufWinEnter" }

    -- DAP
    use { "mfussenegger/nvim-dap", event = "BufWinEnter", as = "nvim-dap" }
    use { "mfussenegger/nvim-dap-python", after = "nvim-dap" }
    use {
      "theHamsta/nvim-dap-virtual-text",
      after = "nvim-dap",
      config = function()
        require("nvim-dap-virtual-text").setup {}
      end,
    }
    use { "rcarriga/nvim-dap-ui", after = "nvim-dap" }
    use { "Pocco81/DAPInstall.nvim", after = "nvim-dap" }
    use { "jbyuki/one-small-step-for-vimkind", after = "nvim-dap" }

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
      cmd = { "SnipRun" },
      run = "bash install.sh",
      config = function()
        require("config.sniprun").setup()
      end,
    }

    -- Rust
    use { "rust-lang/rust.vim", event = "VimEnter" }
    use {
      "simrat39/rust-tools.nvim",
      after = "nvim-lspconfig",
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
      event = "VimEnter",
      ft = "markdown",
      requires = { "godlygeek/tabular" },
    }

    -- Note taking
    -- use {
    --   "nvim-neorg/neorg",
    --   event = "VimEnter",
    --   config = function()
    --     require("config.neorg").setup()
    --   end,
    -- }
    use {
      "stevearc/gkeep.nvim",
      run = ":UpdateRemotePlugins",
    }

    use { "rhysd/vim-grammarous", ft = { "markdown" } }

    use {
      "folke/zen-mode.nvim",
      event = "VimEnter",
      cmd = "ZenMode",
      config = function()
        require("zen-mode").setup {}
      end,
    }
    use {
      "folke/twilight.nvim",
      event = "VimEnter",
      config = function()
        require("twilight").setup {}
      end,
    }

    -- Database
    use {
      "tpope/vim-dadbod",
      event = "VimEnter",
      requires = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion" },
      config = function()
        require("config.dadbod").setup()
      end,
    }

    -- Web
    use {
      "vuki656/package-info.nvim",
      event = "VimEnter",
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
      event = "VimEnter",
      config = function()
        require("better_escape").setup()
      end,
    }

    use { "nathom/filetype.nvim" }

    -- Performance
    use { "tweekmonster/startuptime.vim" }
    -- use {
    --   "dstein64/vim-startuptime",
    --   cmd = "StartupTime",
    --   config = [[vim.g.startuptime_tries = 10]],
    -- }
    -- Clipboard

    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }

    -- Trying

    -- To try
    -- https://github.com/mfussenegger/nvim-lint

    use {
      "akinsho/toggleterm.nvim",
      keys = { [[<c-\>]] },
      cmd = { "ToggleTerm", "TermExec" },
      config = function()
        require("config.toggleterm").setup()
      end,
    }

    use { "kazhala/close-buffers.nvim", cmd = { "BDelete", "BWipeout" } }
    -- use {
    --   "LinArcX/telescope-command-palette.nvim",
    --   after = "telescope",
    --   config = function()
    --     require("config.command-palette").setup()
    --   end,
    -- }
    -- use {
    --   "pianocomposer321/yabs.nvim",
    --   after = "telescope",
    --   requires = { "nvim-lua/plenary.nvim", "pianocomposer321/consolation.nvim" },
    --   config = function()
    --     require("config.yabs").setup()
    --   end,
    -- }

    use { "b0o/schemastore.nvim" }
    use {
      "ThePrimeagen/harpoon",
      -- event = "VimEnter",
      module = "harpoon",
      config = function()
        require("config.harpoon").setup()
      end,
    }
    use { "chaoren/vim-wordmotion", opt = true, fn = { "<Plug>WordMotion_w" } }
    -- use {
    --   "rlch/github-notifications.nvim",
    --   config = [[require('config.github-notifications').setup()]],
    -- }
    -- use {
    --   "danymat/neogen",
    --   config = function()
    --     require("neogen").setup {
    --       enabled = true,
    --     }
    --   end,
    --   requires = "nvim-treesitter/nvim-treesitter",
    -- }
    -- use {
    --   "winston0410/range-highlight.nvim",
    --   requires = { { "winston0410/cmd-parser.nvim" } },
    --   config = function()
    --     require("range-highlight").setup {}
    --   end,
    -- }

    -- use {
    --   "sidebar-nvim/sidebar.nvim",
    --   config = function()
    --     require("sidebar-nvim").setup { open = false }
    --   end,
    -- }
    -- use {
    --   "ldelossa/litee.nvim",
    --   config = function()
    --     require("litee").setup {}
    --   end,
    -- }
    -- use {
    --   "luukvbaal/stabilize.nvim",
    --   config = function()
    --     require("stabilize").setup()
    --   end,
    -- }
    -- use { "skywind3000/vim-quickui" }
    -- use {
    --   "ThePrimeagen/refactoring.nvim",
    --   event = "VimEnter",
    --   config = function()
    --     require("config.refactoring").setup()
    --   end,
    -- }
    -- use {
    --   "mvllow/modes.nvim",
    --   event = "BufRead",
    --   config = function()
    --     vim.opt.cursorline = true
    --     require("modes").setup()
    --   end,
    -- }
    -- use {
    --   "jbyuki/venn.nvim",
    --   event = "VimEnter",
    --   config = function()
    --     vim.api.nvim_set_keymap("v", "<Leader>vb", ":VBox<CR>", { noremap = true })
    --   end,
    -- }
    -- use {
    --   "voldikss/vim-translator",
    --   event = "VimEnter",
    --   setup = function()
    --     vim.g.translator_history_enable = true
    --   end,
    -- }

    -- use { "stevearc/dressing.nvim", event = "BufWinEnter" }
    -- use {
    --   "hrsh7th/vim-vsnip",
    --   event = "VimEnter",
    --   requires = {
    --     "rafamadriz/friendly-snippets",
    --     "cstrap/python-snippets",
    --     "ylcnfrht/vscode-python-snippet-pack",
    --     "xabikos/vscode-javascript",
    --     "golang/vscode-go",
    --     "rust-lang/vscode-rust",
    --   },
    -- }
    -- use { "hrsh7th/cmp-vsnip" }
    --
    -- use {
    --   "weilbith/nvim-code-action-menu",
    --   cmd = "CodeActionMenu",
    -- }
    -- use {"haringsrob/nvim_context_vt"}

    -- LIST of plugins
    -- https://gist.github.com/mengwangk/dc703fb091e25dd75b7ef7c7be3bd4c9

    if packer_bootstrap then
      print "Setting up Neovim. Restart required after installation!"
      require("packer").sync()
    end
  end

  pcall(require, "impatient")
  pcall(require, "packer_compiled")
  require("packer").init(conf)
  require("packer").startup(plugins)
end

return M
