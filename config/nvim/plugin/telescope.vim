lua << EOF
require('telescope').setup{
    require('telescope').load_extension('snippets')
}
EOF

" Find files using Telescope command-line sugar.
nnoremap <silent> <leader>ff :DashboardFindFile<CR>
nnoremap <silent> <leader>fg :Telescope live_grep<cr>
nnoremap <silent> <leader>fb :Telescope buffers<cr>
nnoremap <silent> <leader>ft :Telescope help_tags<cr>
nnoremap <silent> <leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <leader>fc :DashboardChangeColorscheme<CR>
nnoremap <silent> <leader>fw :DashboardFindWord<CR>
nnoremap <silent> <leader>fm :DashboardJumpMark<CR>
nnoremap <silent> <leader>fn :DashboardNewFile<CR>

nmap <leader>fss :<C-u>SessionSave<CR>
nmap <leader>fsl :<C-u>SessionLoad<CR>

 let g:dashboard_custom_shortcut={
      \ 'last_session'       : '<Leader> fs l',
      \ 'find_history'       : '<Leader> f h',
      \ 'find_file'          : '<Leader> f f',
      \ 'new_file'           : '<Leader> f n',
      \ 'change_colorscheme' : '<Leader> f c',
      \ 'find_word'          : '<Leader> f w',
      \ 'book_marks'         : '<Leader> f m',
      \ }
