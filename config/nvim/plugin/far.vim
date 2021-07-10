set lazyredraw
let g:far#enable_undo=1
let g:far#source = 'rg'

" shortcut for far.vim find
nnoremap <silent> <space>lFf  :Farf<cr>
vnoremap <silent> <space>lFf  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <space>lFr  :Farr<cr>
vnoremap <silent> <space>lFr  :Farr<cr>
