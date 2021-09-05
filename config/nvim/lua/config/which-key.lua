-- WIP
local wk = require("which-key")
wk.setup({})

wk.register({
    b = {
        name = "Buffer",
        a = {"<Cmd>%bd|e#<CR>", "Delete all buffers"},
        d = {"<Cmd>bd<CR>", "Delete current buffer"},
        l = {"<Cmd>ls<CR>", "List buffers"},
        n = {"<Cmd>bn<CR>", "Next buffer"},
        p = {"<Cmd>bp<CR>", "Previous buffer"},
        q = {"<Cmd>q<CR>", "Quit"}
    },
    c = {
        name = "LSP Saga",
        c = {"Code action"},
        l = {"LSP finder & line Diagnostics"},
        h = {"Hover doc"},
        t = {"Floaterm"},
        r = {"Rename"},
        s = {"Signature help"},
        p = {"Preview definition"}
    },

    d = {
        name = "DAP",
        t = {"Toggle breakpoint"},
        s = {"Step, set breakpoint, scopes"},
        h = {"Hover"},
        u = {"UI"},
        c = {"Continue, Telescope commands & configs"},
        f = {"Telescope frames"},
        v = {"Telescope variables"}
    },
    ["dl"] = {name = "List breakpoints"},
    ["dr"] = {name = "Repl"},

    K = {name = "Cheatsheet"},
    v = {name = "Vimspector"},
    e = {name = "eSpeak"},
    f = {name = "File & Telescope"},
    g = {name = "Git"},
    h = {name = "Git Signs"},

    l = {name = "LSP"},
    ["lw"] = {name = "Workspace"},
    ["lc"] = {name = "Code action"},
    ["lcl"] = {name = "Code lens"},
    ["ld"] = {name = "Diagnostics"},
    ["lr"] = {name = "References, rename, run"},
    ["ll"] = {name = "Location list"},
    ["lt"] = {name = "Type definition"},
    ["ls"] = {name = "Symbol"},
    ["lf"] = {name = "Format"},
    ["lo"] = {name = "Telescope LSP symbols"},
    ["lq"] = {name = "Telescope quickfix"},

    n = {name = "Floaterm, Narrow, Glow"},
    p = {name = "Project, Treesitter, Lua"},
    q = {name = "Quick fix"},
    r = {name = "Shell run"},
    t = {name = "Test"},
    x = {name = "Treesitter & swap"}
}, {prefix = "<leader>"})
