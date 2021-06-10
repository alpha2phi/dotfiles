" search related docsets
nnoremap <leader>k :Dasht<Space>
" search ALL the docsets
nnoremap <leader><leader>k :Dasht!<Space>
" search related docsets
nnoremap <silent><space>k :call Dasht(dasht#cursor_search_terms())<cr>
" search ALL the docsets
nnoremap <silent><space><space>k :call Dasht(dasht#cursor_search_terms(), '!')<cr>

let g:dasht_filetype_docsets = {}
let g:dasht_filetype_docsets['clojure'] = ['javascript', 'html', 'svg']
" create new tab beside current one
let g:dasht_results_window = 'tabnew'

