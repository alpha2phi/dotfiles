local M = {}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true
}

local vopts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true
}

local mappings = {
    ["w"] = {"<Cmd>w<CR>", "Save"},
    ["q"] = {"<Cmd>q<CR>", "Quit"},

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
        r = {'<Cmd>luafile %<CR>', "Reload lua file"},
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
        s = {"<Cmd>Telescope symbols<Cr>", "Recent file"},
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
            "<Cmd>lua require'telescope'.extensions.project.project{ change_dir = true }<Cr>",
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

    -- Magma
    m = {
        name = "Jupyter mode - Magma",
        l = {"<Cmd>MagmaEvaluateLine<Cr>", "Evaluate line"},
        r = {"<Cmd>MagmaReevaluateCell<Cr>", "Reevaluate Cell"},
        d = {"<Cmd>MagmaDelete<Cr>", "Delete"},
        o = {"<Cmd>MagmaShowOutput<Cr>", "Show output"},
        i = {"<Cmd>MagmaInit<Cr>", "Init"},
        u = {"<Cmd>MagmaDeinit<Cr>", "Deinit"}
    },

    K = {name = "Cheatsheet"},
    C = {name = "Cheatsheet (toggle comment)"},
    h = {name = "git signs"},
    x = {name = "treesitter & swap"}

}

local vmappings = {
    s = {
        name = "Search",
        v = {"<Cmd>lua require('spectre').open_visual()<CR>", "Visual search"},
        b = {"<Plug>SearchVisual", "Browser search"}
    },
    e = {name = "eSpeak", s = {"<Cmd>call tts#Speak(1)<CR>", "Speak"}},
    m = {
        name = "Jupyter mode - Magma",
        e = {"<Cmd><C-u>MagmaEvaluateVisual<Cr>", "Evaluate"}
    }

}

local lsp_mappings = {
    -- c = {
    --     name = "lsp saga",
    --     c = {"code action"},
    --     l = {"lsp finder & line diagnostics"},
    --     h = {"hover doc"},
    --     t = {"floaterm"},
    --     r = {"rename"},
    --     s = {"signature help"},
    --     p = {"preview definition"}
    -- },

    -- Vimspector
    ["<F5>"] = {name = "Vimspector - Launch"},
    ["<F8>"] = {name = "Vimspector - Run to Cursor"},
    ["<F9>"] = {name = "Vimspector - Cond. Breakpoint"},

    l = {name = "lsp"},
    ["lw"] = {name = "workspace"},
    ["lc"] = {name = "code action"},
    ["lcl"] = {name = "code lens"},
    ["ld"] = {name = "diagnostics"},
    ["lr"] = {name = "references, rename, run"},
    ["ll"] = {name = "location list"},
    ["lt"] = {name = "type definition"},
    ["ls"] = {name = "symbol"},
    ["lf"] = {name = "format"},
    ["lo"] = {name = "telescope lsp symbols"},
    ["lq"] = {name = "telescope quickfix"}

}

local dap_mappings = {

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

function M.register_lsp() end

function M.register_dap() end

function M.setup()
    local wk = require("which-key")
    wk.setup({})
    wk.register(mappings, opts)
    wk.register(vmappings, vopts)
end

return M

