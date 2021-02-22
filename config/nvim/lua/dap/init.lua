require('dap.python')

local utils = require('utils')

utils.map('n', '<leader>z', '<cmd>h set<CR>') 

utils.map('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>') 
utils.map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>') 
utils.map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>') 
utils.map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>') 
utils.map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>') 
utils.map('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>') 
utils.map('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>') 
utils.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>') 
utils.map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>') 

-- nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
-- nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
-- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.repl.run_last()<CR>




