-- Configuration for completion-nvim
local utils = require('utils')

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.diagnostic_enable_virtual_text = 1
-- vim.g.completion_enable_snippet = 'snippets.vim'
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_enable_auto_popup = 1

-- <Tab> to navigate the completion menu
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

vim.api.nvim_command([[
augroup AuCompletion
autocmd BufEnter * lua require'completion'.on_attach()
augroup END
]])
