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
    }
}, {prefix = "<leader>"})
