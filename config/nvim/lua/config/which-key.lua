local M = {}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = true
}

local vopts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = true
}

local mappings = {
    ["w"] = {"<Cmd>w<Cr>", "Save"},
    ["q"] = {"<Cmd>q<Cr>", "Quit"},

    -- System
    ["z"] = {
        name = "System",
        b = {
            '<Cmd>hi Normal ctermbg=none guibg=none<CR>',
            "Transparent background"
        },
        s = {':<C-u>SaveSession<Cr>', 'Save session'},
        l = {':<C-u>RestoreSession<Cr>', 'Load session'},
        c = {'<Cmd>DashboardChangeColorscheme<Cr>', "Color scheme"},
        t = {'<Cmd>15sp +term<CR>', "New terminal"},
        e = {'!!$SHELL<CR>', 'Execute line'},
        z = {
            "<Cmd>lua require('config.telescope').search_dotfiles()<CR>",
            "Configuration"
        },
        r = {"<Cmd>luafile %<Cr>", "Reload lua file"},
        p = {
            ":let &runtimepath.=','.escape(expand('%:p:h'), '\\,')<Cr>",
            "Set runtime path"
        },
        f = {"<Cmd>FloatermNew<Cr>", "Floating terminal"},
        i = {"<Cmd>PackerInstall<Cr>", "Packer install"}
        -- n = {
        --     "<Cmd>FloatermNew nvim ~/workspace/myself/notes/notes.md<Cr>",
        --     "Floating note"
        -- }
    },

    -- Buffer
    b = {
        name = "Buffer",
        a = {"<Cmd>%bd|e#<Cr>", "Delete all buffers"},
        d = {"<Cmd>bd<Cr>", "Delete current buffer"},
        l = {"<Cmd>ls<Cr>", "List buffers"},
        n = {"<Cmd>bn<Cr>", "Next buffer"},
        p = {"<Cmd>bp<Cr>", "Previous buffer"}
    },

    -- Quick fix
    c = {
        name = "Quickfix",
        o = {"<Cmd>copen<Cr>", "Open quickfix"},
        c = {"<Cmd>cclose<Cr>", "Close quickfix"},
        n = {"<Cmd>cnext<Cr>", "Next quickfix"},
        p = {"<Cmd>cprev<Cr>", "Previous quickfix"},
        x = {"<Cmd>cex []<Cr>", "Clear quickfix"}
    },

    -- File
    f = {
        name = "File",
        b = {"<Cmd>Telescope buffers<Cr>", "Search buffers"},
        f = {"<Cmd>Telescope git_files<Cr>", "Git files"}, -- or DashboardFindFile
        g = {"<Cmd>Telescope live_grep<Cr>", "Live grep"},
        h = {"<Cmd>Telescope help_tags<Cr>", "Help"},
        p = {"<Cmd>Telescope file_browser<Cr>", "Pop-up file browser"},
        x = {"<Cmd>DashboardFindHistory<Cr>", "History"},
        m = {"<Cmd>DashboardJumpMark<Cr>", "Mark"},
        n = {"<Cmd>DashboardNewFile<Cr>", "New file"},
        r = {"<Cmd>Telescope frecency<Cr>", "Recent file"},
        s = {"<Cmd>Telescope symbols<Cr>", "Symbols"},
        a = {"<Cmd>xa<Cr>", "Save all & quit"},
        e = {"<Cmd>NvimTreeToggle<CR>", "Explorer"},
        z = {"<Cmd>lefta 20vsp .<CR>", "Netrw"}
    },

    -- Git
    g = {
        name = "Source code",
        s = {"<Cmd>Git<Cr>", "Git status"},
        p = {"<Cmd>Git push<Cr>", "Git push"},
        b = {"<Cmd>Git branch<Cr>", "Git branch"},
        d = {"<Cmd>Gvdiffsplit<Cr>", "Git diff"},
        f = {"<Cmd>Git fetch --all<Cr>", "Git fetch"},
        n = {"<Cmd>Neogit<Cr>", "NeoGit"},
        ["r"] = {
            name = "Rebase",
            u = {
                "<Cmd>Git rebase upstream/master<Cr>",
                "Git rebase upstream/master"
            },
            o = {
                "<Cmd>Git rebase origin/master<Cr>", "Git rebase origin/master"
            }
        },
        x = {
            name = "Diff",
            ["2"] = {"<Cmd>diffget //2", "Diffget 2"},
            ["3"] = {"<Cmd>diffget //3", "Diffget 3"}
        },
        g = {name = "Generate doc"}
    },

    -- eSpeak
    e = {name = "eSpeak", s = {"<Cmd>call tts#Speak()<CR>", "Speak"}},

    -- Project
    p = {
        name = "Project",
        s = {
            "<Cmd>lua require('config.telescope').switch_projects()<CR>",
            "Search files"
        },
        p = {
            "<Cmd>lua require('telescope').extensions.project.project({change_dir = true})<Cr>",
            "List projects"
        }
    },

    -- Easymotion
    ["<Space>"] = {name = "Easymotion"},

    -- Search
    ["s"] = {
        name = "Search",
        w = {
            "<Cmd>lua require('telescope').extensions.arecibo.websearch()<CR>",
            "Web search"
        },
        s = {"<Cmd>lua require('spectre').open()<CR>", "Search"},
        b = {"<Plug>SearchNormal", "Browser search"},
        v = {
            "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>",
            "Visual search"
        },
        f = {
            "viw:lua require('spectre').open_file_search()<Cr>",
            "Open file search"
        },
        c = {"q:", "Command history"},
        g = {"q/", "Grep history"}
    },

    -- Testing
    t = {
        name = "Test",
        n = {"<Cmd>w<CR>:TestNearest<CR>", "Test nearest"},
        f = {"<Cmd>w<CR>:TestFile<CR>", "Test file"},
        s = {"<Cmd>w<CR>:TestSuite<CR>", "Test suite"},
        l = {"<Cmd>w<CR>:TestLast<CR>", "Test last"},
        v = {"<Cmd>w<CR>:TestVisit<CR>", "Test visit"}
    },

    -- -- Magma
    -- m = {
    --     name = "Jupyter mode - Magma",
    --     l = {"<Cmd>MagmaEvaluateLine<Cr>", "Evaluate line"},
    --     r = {"<Cmd>MagmaReevaluateCell<Cr>", "Reevaluate Cell"},
    --     d = {"<Cmd>MagmaDelete<Cr>", "Delete"},
    --     o = {"<Cmd>MagmaShowOutput<Cr>", "Show output"},
    --     i = {"<Cmd>MagmaInit<Cr>", "Init"},
    --     u = {"<Cmd>MagmaDeinit<Cr>", "Deinit"}
    -- },

    K = {name = "Cheatsheet"},
    C = {name = "Cheatsheet (toggle comment)"},
    h = {name = "Git signs"},
    x = {name = "treesitter & swap"}

}

local vmappings = {
    s = {
        name = "Search",
        v = {"<Cmd>lua require('spectre').open_visual()<CR>", "Visual search"},
        b = {"<Plug>SearchVisual", "Browser search"}
    },
    e = {name = "eSpeak", s = {"<Cmd>call tts#Speak(1)<CR>", "Speak"}}
    -- m = {
    --     name = "Jupyter mode - Magma",
    --     e = {"<Cmd><C-u>MagmaEvaluateVisual<Cr>", "Evaluate"}
    -- }
}

local lsp_mappings = {

    l = {
        name = "LSP",
        r = {"<Cmd>Lspsaga rename<CR>", "Rename"},
        -- r = {"<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename"}

        u = {"<Cmd>Telescope lsp_references<CR>", "References"}
        -- u = {"<Cmd>Lspsaga lsp_finder<CR>", "References"},
        -- u = {"<Cmd>lua vim.lsp.buf.references()<CR>", "References"},

    }

    -- WIP - refactoring

    -- c = {
    --     name = "lsp saga",
    --     c = {"code action"},
    --     l = {"lsp finder & line diagnostics"},
    --     h = {"hover doc"},
    --     t = {"floaterm"},
    --     s = {"signature help"},
    --     p = {"preview definition"}
    -- },

    -- l = {name = "lsp"},
    -- ["lw"] = {name = "workspace"},
    -- ["lc"] = {name = "code action"},
    -- ["lcl"] = {name = "code lens"},
    -- ["ld"] = {name = "diagnostics"},
    -- ["lr"] = {name = "references, rename, run"},
    -- ["ll"] = {name = "location list"},
    -- ["lt"] = {name = "type definition"},
    -- ["ls"] = {name = "symbol"},
    -- ["lf"] = {name = "format"},
    -- ["lo"] = {name = "telescope lsp symbols"},
    -- ["lq"] = {name = "telescope quickfix"}

    -- nnoremap <silent><leader>cca :Lspsaga code_action<CR>
    -- vnoremap <silent><leader>cca :<C-U>Lspsaga range_code_action<CR>
    -- nnoremap <silent><leader>chd :Lspsaga hover_doc<CR>
    -- nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
    -- nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
    -- nnoremap <silent><leader>csh :Lspsaga signature_help<CR>
    -- nnoremap <silent><leader>crn :Lspsaga rename<CR>
    -- nnoremap <silent><leader>cpd:Lspsaga preview_definition<CR>
    -- nnoremap <silent> <leader>cld :Lspsaga show_line_diagnostics<CR>
    -- nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
    -- nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
    -- nnoremap <silent> <leader>cto :Lspsaga open_floaterm<CR>
    -- tnoremap <silent> <leader>ctc <C-\><C-n>:Lspsaga close_floaterm<CR>

    --     {'n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'},
    --     {'n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'},
    --     {
    --         'n', '<leader>lwl',
    --         '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'
    --     }, {'n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>'},
    --     {
    --         'n', '<leader>lds',
    --         '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'
    --     }, {'n', '<leader>lde', '<cmd>lua vim.lsp.diagnostic.enable()<CR>'},
    --     {'n', '<leader>ldd', '<cmd>lua vim.lsp.diagnostic.disable()<CR>'},
    --     {'n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'},
    --     {'n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
    --     {'v', '<leader>lcr', '<cmd>lua vim.lsp.buf.range_code_action()<CR>'},
    --     {'n', '<leader>lss', '<cmd>lua vim.lsp.buf.document_symbol()<CR>'},
    --     {'n', '<leader>lsw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>'}

}

local lsp_mappings_opts = {
    {
        "document_formatting",
        {["lf"] = {"<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format"}}
    },
    {
        "code_lens",
        {["ll"] = {"<Cmd>lua vim.lsp.codelens.refresh()<CR>", "Codelens"}}
    }

    --     {
    --         "document_range_formatting", "n", "<leader>lfr",
    --         "<cmd>lua vim.lsp.buf.range_formatting()<CR>"
    --     },
    --     {
    --         "code_lens", "n", "<leader>lcld",
    --         "<Cmd>lua vim.lsp.codelens.refresh()<CR>"
    --     }, {"code_lens", "n", "<leader>lclr", "<Cmd>lua vim.lsp.codelens.run()<CR>"}
}

local dap_mappings = {

    -- Vimspector
    -- ["<F5>"] = {name = "Vimspector - Launch"},
    -- ["<F8>"] = {name = "Vimspector - Run to Cursor"},
    -- ["<F9>"] = {name = "Vimspector - Cond. Breakpoint"},

    d = {
        name = "dap",
        t = {"toggle breakpoint"},
        s = {"step, set breakpoint, scopes"},
        h = {"hover"},
        u = {"ui"},
        c = {"continue, telescope commands & configs"},
        f = {"telescope frames"},
        v = {"telescope variables"}
    },

    ["dl"] = {name = "list breakpoints"},
    ["dr"] = {name = "repl"},

    v = {name = "vimspector"}
}

function M.register_lsp(client)
    local wk = require("which-key")
    wk.register(lsp_mappings, opts)

    for _, m in pairs(lsp_mappings_opts) do
        local capability, key = unpack(m)
        if client.resolved_capabilities[capability] then
            wk.register(key, opts)
        end
    end
end

function M.register_dap(client)
    local wk = require("which-key")
    wk.register(dap_mappings, opts)
end

function M.setup()
    local wk = require("which-key")
    wk.setup({})
    wk.register(mappings, opts)
    wk.register(vmappings, vopts)
end

return M

