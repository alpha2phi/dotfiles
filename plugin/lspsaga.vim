nnoremap <silent><leader>ff :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>aa :Lspsaga code_action<CR>
vnoremap <silent><leader>aa :<C-U>Lspsaga range_code_action<CR>

nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent><a-j> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent><a-k> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent><C-k> :Lspsaga signature_help<CR>

nnoremap <silent><leader>rr :Lspsaga rename<CR>

nnoremap <silent><leader>gpd :Lspsaga preview_definition<CR>

" nnoremap <silent><leader>dd :Lspsaga show_line_diagnostics<CR>

" nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

