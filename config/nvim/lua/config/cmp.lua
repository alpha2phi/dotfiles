local cmp = require('cmp')
cmp.setup {
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        })
    },

    sources = {{name = 'buffer'}, {name = 'nvim_lsp'}},
    completion = {completeopt = 'menu,menuone,noinsert'}
}

require("nvim-autopairs.completion.cmp").setup({
    map_cr = true,
    map_complete = true,
    auto_select = true
})
