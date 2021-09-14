local M = {}

function M.setup()
  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

  parser_configs.norg = {
    install_info = {
      url = "https://github.com/nvim-neorg/tree-sitter-norg",
      files = { "src/parser.c", "src/scanner.cc" },
      branch = "main",
    },
  }

  require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,
      disable = {},
      -- custom_captures = {["new_import"] = "CustomImportName"}
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = { enable = true },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
    },
    rainbow = { enable = true, extended_mode = true },
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = { ["<Leader>rx"] = "@parameter.inner" },
        swap_previous = { ["<Leader>rX"] = "@parameter.inner" },
      },
      lsp_interop = {
        enable = true,
        border = "none",
        peek_definition_code = {
          ["df"] = "@function.outer",
          ["dF"] = "@class.outer",
        },
      },
      -- refactor = {
      --     highlight_definitions = {enable = true},
      --     highlight_current_scope = {enable = true},
      --     smart_rename = {
      --         enable = true,
      --         keymaps = {smart_rename = "grr"}
      --         -- keymaps = {smart_rename = "<leader>rn"}
      --     },
      --     navigation = {
      --         enable = true,
      --         keymaps = {
      --             goto_definition = "gnd",
      --             list_definitions = "gnD",
      --             list_definitions_toc = "gO",
      --             goto_next_usage = "<a-*>",
      --             goto_previous_usage = "<a-#>"
      --         }
      --     }
      -- }
    },
    context_commentstring = { enable = true },
    textsubjects = {
      enable = true,
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
      },
    },
    matchup = { enable = true },
  }
end

return M
