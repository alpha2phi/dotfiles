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
        l = {"Lsp finder & line Diagnostics"},
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
    K = {name = "Cheatsheet"},
    v = {name = "Vimspector"},
    e = {name = "eSpeak"},
    f = {name = "File & Telescope"},
    g = {name = "Git"},
    h = {name = "Git Signs"},
    l = {name = "LSP"},
    n = {name = "Floaterm, Narrow, Glow"},
    p = {name = "Project, Treesitter, Lua"},
    q = {name = "Quick fix"},
    r = {name = "Shell run"},
    t = {name = "Test"},
    x = {name = "Treesitter & swap"}
}, {prefix = "<leader>"})
