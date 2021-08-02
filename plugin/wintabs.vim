let g:wintabs_ignored_filetypes = ['gitcommit', 'packer', 'qf', 'ranger', 'chadtree']
let g:wintabs_switchbuf = 'useopen'

command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtabs

map [b <Plug>(wintabs_previous)
map ]b <Plug>(wintabs_next)
map <leader>bc <Plug>(wintabs_close)
map <leader>bu <Plug>(wintabs_undo)
map <leader>bo <Plug>(wintabs_only)
map <leader>wc <Plug>(wintabs_close_window)
map <leader>wo <Plug>(wintabs_only_window)

nnoremap <leader>bn :enew<CR>
nnoremap <leader>wn :tabnew<CR>
nnoremap <leader>wq :WintabsCloseVimtab<CR>
nnoremap [w :tabprevious<cr>
nnoremap ]w :tabnext<cr>

let g:wintabs_powerline_arrow_left = "\u25b6"

" Left pointing arrow, used as previous buffers indicator.

let g:wintabs_powerline_arrow_right = "\u25c0"

" Right pointing arrow, used as next buffers indicator.

let g:wintabs_powerline_sep_buffer_transition = "\ue0b0"

" Separator between inactive and active buffers.

let g:wintabs_powerline_sep_buffer = "\ue0b1"

" Separator between inactive buffers.

let g:wintabs_powerline_sep_tab_transition = "\ue0b2"

" Separator between inactive and active vimtabs.

let g:wintabs_powerline_sep_tab = "\ue0b3"

" Separator between inactive vimtabs.

highlight link WintabsEmpty TabLineFill

" Highlight group for background.

highlight link WintabsActive TabLineSel

" Highlight group for active buffer/tab.

highlight link WintabsInactive TabLineFill

" Highlight group for inactive buffer/tab.

highlight link WintabsArrow TabLine

" Highlight group for arrows.

highlight link WintabsActiveNC TabLine

" Highlight group for active buffer/tab in not-current windows.

highlight link WintabsInactiveNC TabLine

" Highlight group for inactive buffer/tab in not-current windows.

