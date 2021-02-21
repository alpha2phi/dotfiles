local utils = require('utils')

utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.completion_enable_snippet = 'snippets.vim'

-- <Tab> to navigate the completion menu
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
