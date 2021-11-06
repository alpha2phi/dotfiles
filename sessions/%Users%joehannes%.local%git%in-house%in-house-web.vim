let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd ~/.config/nvim/init.lua
edit ~/.local/git/in-house/in-house-web/package.json
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/.local/git/in-house/in-house-web/src/pages/houses.jsx
let s:l = 17 - ((15 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 037|
wincmd w
argglobal
if bufexists("~/.local/git/in-house/in-house-web/src/store/venues/saga/votePost.js") | buffer ~/.local/git/in-house/in-house-web/src/store/venues/saga/votePost.js | else | edit ~/.local/git/in-house/in-house-web/src/store/venues/saga/votePost.js | endif
if &buftype ==# 'terminal'
  silent file ~/.local/git/in-house/in-house-web/src/store/venues/saga/votePost.js
endif
balt ~/.local/git/in-house/in-house-web/src/store/venues/saga/togglePostFlag.js
let s:l = 34 - ((28 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 34
normal! 035|
wincmd w
wincmd =
badd +34 ~/.local/git/in-house/in-house-web/src/store/venues/saga/votePost.js
badd +0 ~/.local/git/in-house/in-house-web/package.json
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=aoO
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
