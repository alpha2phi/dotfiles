highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1

nmap <leader>tm <Plug>BookmarkToggle
nmap <leader>tMa <Plug>BookmarkAnnotate
nmap <leader>fm :CocCommand fzf-preview.Bookmarks<cr>
nmap ]m <Plug>BookmarkNext
nmap [m <Plug>BookmarkPrev
nmap <leader>xm <Plug>BookmarkClearAll
nmap <leader>wm <Plug>BookmarkSave ~/.config/nvim/bookmarks
nmap <leader>lm <Plug>BookmarkLoad ~/.config/nvim/bookmarks

if v:vim_did_enter
  exec "normal \<Plug>BookmarkLoad ~/.config/nvim/bookmarks"
else
 au VimEnter * exec "normal \<Plug>BookmarkLoad ~/.config/nvim/bookmarks"
endif

au VimLeavePre * exec "normal \<Plug>BookmarkSave ~/.config/nvim/bookmarks"

