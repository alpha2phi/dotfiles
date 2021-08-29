vim.api.nvim_exec([[

nnoremap <silent><expr> <Leader>m  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <Leader>ml :MagmaEvaluateLine<CR>
xnoremap <silent>       <Leader>m  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <Leader>mr :MagmaReevaluateCell<CR>
nnoremap <silent>       <Leader>md :MagmaDelete<CR>
nnoremap <silent>       <Leader>mo :MagmaShowOutput<CR>
nnoremap <silent>       <Leader>mi :MagmaInit<CR>
nnoremap <silent>       <Leader>mu :MagmaDeinit<CR>

let g:magma_automatically_open_output = v:false

]], false)
