" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
			\ 'javascript': 'ctags -R',
			\ 'javascriptreact': 'ctags -R',
			\ 'javascript.jsx': 'ctags -R',
			\ 'typescript': 'ctags -R',
			\ 'typescriptreact': 'ctags -R',
			\ 'typescript.tsx': 'ctags -R',
      \ 'css': 'ctags -R',
			\ 'scss': 'ctags -R',
			\ 'sass': 'ctags -R',
      \ 'clojure': 'ctags -R',
      \ 'clojurescript': 'ctags -R',
			\ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:35%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" toggle structural view
nnoremap <leader>to :Vista!!<cr>

" toggle fuzzy in buffer tag finder
nnoremap <space>ftv :Vista finder<CR>

