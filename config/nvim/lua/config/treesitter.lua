require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {} -- list of language that will be disabled
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm'
        }
    },
    indent = {enable = true},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    rainbow = {enable = true, extended_mode = true},
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
                ["ic"] = "@class.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer'
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer'
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer'
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer'
            }
        },
        swap = {
            enable = true,
            swap_next = {["<leader>xp"] = "@parameter.inner"},
            swap_previous = {["<leader>xP"] = "@parameter.inner"}
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ["<leader>pf"] = "@function.outer",
                ["<leader>pc"] = "@class.outer"
            }
        },
        refactor = {
            highlight_definitions = {enable = true},
            highlight_current_scope = {enable = true},
            smart_rename = {
                enable = true,
                keymaps = {smart_rename = "<leader>rn"}
            }
        }
    }
}
