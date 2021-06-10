let g:reply_repls = {
\   'javascriptreact': ['node'],
\   'typescriptreact': ['ts_node'],
\   'clojure': ['clojure']
\ }

vnoremap <leader>tr :'<,'>Repl<cr>
nnoremap <leader>tr :%Repl<cr>

