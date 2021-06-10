let g:vrc_curl_opts = {
  \ '--connect-timeout' : 10,
  \ '-L': '',
  \ '-i': '',
  \ '--max-time': 60,
  \ '--ipv4': '',
  \ '-k': '',
\}

nnoremap <leader>t$ :edit ~/.local/snippets/vim.rest<CR>
nnoremap <leader>r$ :call VrcQuery()<CR>

