local M = {}

function M.setup()

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
    end

    local cmp = require('cmp')

    cmp.setup {
        formatting = {
            format = function(entry, vim_item)
                -- fancy icons and a name of kind
                vim_item.kind =
                    require("lspkind").presets.default[vim_item.kind] .. " " ..
                        vim_item.kind
                -- set a name for each source
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    ultisnips = "[UltiSnips]",
                    nvim_lua = "[Lua]",
                    cmp_tabnine = "[TabNine]",
                    look = "[Look]",
                    path = "[Path]",
                    spell = "[Spell]",
                    calc = "[Calc]",
                    emoji = "[Emoji]",
                    treesitter = "[treesitter]"
                })[entry.source.name]
                return vim_item
            end
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
            }),
            ["<C-Space>"] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
                        return vim.fn.feedkeys(t(
                                                   "<C-R>=UltiSnips#ExpandSnippet()<CR>"))
                    end
                    vim.fn.feedkeys(t("<C-n>"), "n")
                elseif check_back_space() then
                    vim.fn.feedkeys(t("<cr>"), "n")
                else
                    fallback()
                end
            end, {"i", "s"}),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if vim.fn.complete_info()["selected"] == -1 and
                    vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
                    vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"))
                elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.fn
                        .feedkeys(t("<ESC>:call UltiSnips#JumpForwards()<CR>"))
                elseif vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t("<C-n>"), "n")
                elseif check_back_space() then
                    vim.fn.feedkeys(t("<tab>"), "n")
                else
                    fallback()
                end
            end, {"i", "s"}),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    return vim.fn.feedkeys(t(
                                               "<C-R>=UltiSnips#JumpBackwards()<CR>"))
                elseif vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t("<C-p>"), "n")
                else
                    fallback()
                end
            end, {"i", "s"})
        },
        snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end
        },
        sources = {
            {name = "buffer"}, {name = "nvim_lsp"}, {name = "ultisnips"},
            {name = "nvim_lua"}, {name = "look"}, {name = "path"},
            {name = "calc"}, {name = "spell"}, {name = "emoji"},
            {name = "treesitter"} -- {name = 'cmp_tabnine'}
        },
        completion = {completeopt = 'menu,menuone,noinsert'}
    }

    -- Autopairs
    require("nvim-autopairs.completion.cmp").setup({
        map_cr = true,
        map_complete = true,
        auto_select = true
    })

    -- TabNine
    local tabnine = require('cmp_tabnine.config')
    tabnine:setup({max_lines = 1000, max_num_results = 20, sort = true})

    -- Database completion
    vim.api.nvim_exec([[
        autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
    ]], false)
end

return M
