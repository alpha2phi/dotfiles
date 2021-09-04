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
    K = {name = "Cheatsheet"}
}, {prefix = "<leader>"})
