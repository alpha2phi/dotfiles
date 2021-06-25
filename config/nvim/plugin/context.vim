let g:context_enabled = 1
let g:context_filetype_blacklist = ['chadtree', 'vista', 'Telescope']
let g:context_add_autocmds = 1
let g:context_presenter = 'nvim-float'

nnoremap <silent> <leader>tc :ContextToggle<CR>
