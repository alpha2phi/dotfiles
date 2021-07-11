require("spectre").setup {}

vim.api.nvim_exec([[
    nnoremap <leader>ss :lua require('spectre').open()<CR>
    nnoremap <leader>sw viw:lua require('spectre').open_visual()<CR>
    vnoremap <leader>sv :lua require('spectre').open_visual()<CR>
    nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
]], false)
