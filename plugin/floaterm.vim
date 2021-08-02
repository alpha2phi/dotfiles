hi FloatermBorder guibg=magenta guifg=cyan
set shell=/bin/zsh

let g:floaterm_height=0.9
let g:floaterm_width=0.9
let g:floaterm_wintype='floating'
let g:floaterm_position='top'
let g:floaterm_winblend=10

nnoremap <leader>tt :FloatermToggle<CR>
tnoremap <leader>tt <C-\><C-n>:FloatermToggle<cr>
inoremap <leader>tt <C-\><C-n>:FloatermToggle<cr>
nnoremap <leader>Tn :FloatermNew<cr>
tnoremap <leader>Tn <C-\><C-n>:FloatermNew<cr>
nnoremap ]t :FloatermNext<cr>
nnoremap [t :FloatermPrev<cr>
tnoremap ]t <c-\><c-n>:FloatermNext<cr>
tnoremap [t <c-\><c-n>:FloatermPrev<cr>
