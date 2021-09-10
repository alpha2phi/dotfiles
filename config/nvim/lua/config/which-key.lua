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
        f = {"<Cmd>FloatermNew<Cr>", "Floating terminal"}
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
        p = {"<Cmd>Telescope file_browser<Cr>", "Pop-up browser"},
        x = {"<Cmd>DashboardFindHistory<Cr>", "History"},
        m = {"<Cmd>DashboardJumpMark<Cr>", "Mark"},
        n = {"<Cmd>DashboardNewFile<Cr>", "New file"},
        r = {"<Cmd>Telescope frecency<Cr>", "Recent file"},
        s = {"<Cmd>Telescope symbols<Cr>", "Recent file"},
        a = {"<Cmd>xa<Cr>", "Save all & quit"},
        e = {"<Cmd>NvimTreeToggle<CR>", "Explorer"},
        z = {"<Cmd>lefta 20vsp .<CR>", "Netrw"}
    },

    -- eSpeak
    e = {name = "eSpeak", s = {"<Cmd>call tts#Speak()<CR>", "Speak"}},

    -- Project
    p = {
        name = "Project",
        s = {
            "<Cmd>lua require('config.telescope').switch_projects()<CR>",
            "Search project files"
        }
    },

    -- Git
    g = {name = "Source code", d = {name = "Generate doc"}},

    -- Easymotion
    ["<Space>"] = {name = "Easymotion"},

    -- Vimspector
    ["<F5>"] = {name = "Vimspector - Launch"},
    ["<F8>"] = {name = "Vimspector - Run to Cursor"},
    ["<F9>"] = {name = "Vimspector - Cond. Breakpoint"},

    -- Search
    ["s"] = {
        name = "Search",
        w = {
            "<Cmd>lua require('telescope').extensions.arecibo.websearch()<CR>",
            "Web search"
        },
        s = {"<Cmd>lua require('spectre').open()<CR>", "Search"},
        b = {name = "Web search currrent word"},
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

    -- Test
    t = {
        name = "Test",
        n = ":w<CR>:TestNearest<CR>",
        "Test nearest",
        f = ":w<CR>:TestFile<CR>",
        "Test file",
        s = ":w<CR>:TestSuite<CR>",
        "Test suite",
        l = ":w<CR>:TestLast<CR>",
        "Test last",
        v = ":w<CR>:TestVisit<CR>",
        "Test visit"
    },

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

    ["dl"] = {name = "list breakpoints"},
    ["dr"] = {name = "repl"},

    k = {name = "cheatsheet"},
    v = {name = "vimspector"},
    h = {name = "git signs"},

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
    ["lq"] = {name = "telescope quickfix"},

    n = {name = "floaterm, narrow, glow"},
    x = {name = "treesitter & swap"}

}

local vmappings = {
    s = {
        name = "Search",
        v = {"<Cmd>lua require('spectre').open_visual()<CR>", "Visual search"}
    },
    e = {name = "eSpeak", s = {"<Cmd>call tts#Speak(1)<CR>", "Speak"}}

}

function M.setup()
    local wk = require("which-key")
    wk.setup({})
    wk.register(mappings, opts)
    wk.register(vmappings, vopts)
end

return M

