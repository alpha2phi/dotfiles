nnoremap <leader>xb :DeleteHiddenBuffers<cr>

au VimLeavePre * exec "normal \:DeleteHiddenBuffers"
