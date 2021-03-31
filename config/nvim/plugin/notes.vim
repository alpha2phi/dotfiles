" VimWiki
let g:vimwiki_list = [{ 'path': '~/workspace/personal/myself/notes', 'syntax':'markdown', 'ext': '.md' }]

autocmd FileType vimwiki set ft=markdown

nnoremap <silent> <leader>wp <Cmd>Glow<CR>


" lua << EOF
" require('neuron').setup {
"     virtual_titles = true,
"     mappings = true,
"     run = nil, 
"     neuron_dir = "~/workspace/personal/myself/notes", 
"     leader = "gz", 
" }
" EOF

