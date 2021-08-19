let g:cljfmt_on_save = 1

" nnoremap <leader>rf :CljFmt<CR>

let g:clj_fmt_config = '{:indentation? true, :remove-surrounding-whitespace? true, :remove-trailing-whitespace? true, :remove-consecutive-blank-lines? false, :insert-missing-whitespace? true, :align-associative? false, :indents {#"^\w" [[:inner 0]], #".*" [[:inner 0]]}}'

