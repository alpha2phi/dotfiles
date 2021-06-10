" Open ranger at current file with "-"
nnoremap <silent> <leader>tFc :RangerCurrentFile<CR>

" Open ranger in current working directory
nnoremap <silent> <leader>tf :Ranger<CR>

" for setting ranger viewmode values
" supported values are ['multipane', 'miller']
let g:neoranger_viewmode='miller'

" this line makes ranger show hidden files by default
let g:neoranger_opts='--cmd="set show_hidden true"'
