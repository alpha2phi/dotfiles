lua << EOF

local saga = require 'lspsaga'
saga.init_lsp_saga()

EOF

nnoremap <silent><leader>cf :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

nnoremap <silent><leader>ck :Lspsaga hover_doc<CR>
nnoremap <silent><a-j> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent><a-k> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent><leader>csk :Lspsaga signature_help<CR>

nnoremap <silent><leader>cr :Lspsaga rename<CR>

nnoremap <silent><leader>cp :Lspsaga preview_definition<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>

nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

nnoremap <silent> <leader>ct :Lspsaga open_floaterm<CR>
tnoremap <silent> <leader>ct <C-\><C-n>:Lspsaga close_floaterm<CR>
