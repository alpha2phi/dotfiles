" VimWiki
let g:vimwiki_list = [{ 'path': '~/workspace/personal/myself/notes', 'syntax':'markdown', 'ext': '.md' }]

autocmd FileType vimwiki set ft=markdown

nnoremap <silent> <leader>wp <Cmd>Glow<CR>
