vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
vim.bo.textwidth = 0
vim.bo.autoindent = true
vim.bo.smartindent = true

vim.cmd [[
    compiler python
    " nnoremap <buffer> <leader>rr :silent make <bar> redraw!<cr>
]]
