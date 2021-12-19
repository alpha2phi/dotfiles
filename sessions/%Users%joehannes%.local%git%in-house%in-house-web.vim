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
edit ~/.local/git/in-house/in-house-web/src/pages/polls.jsx
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
let s:l = 20 - ((19 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 20
normal! 042|
lcd ~/.local/git/in-house/in-house-web
wincmd w
argglobal
if bufexists("~/.local/git/in-house/in-house-web/src/store/venues/saga/toggleMinkFlag.js") | buffer ~/.local/git/in-house/in-house-web/src/store/venues/saga/toggleMinkFlag.js | else | edit ~/.local/git/in-house/in-house-web/src/store/venues/saga/toggleMinkFlag.js | endif
if &buftype ==# 'terminal'
  silent file ~/.local/git/in-house/in-house-web/src/store/venues/saga/toggleMinkFlag.js
endif
balt ~/.local/git/in-house/in-house-web/src/store/venues/selectors.js
let s:l = 41 - ((40 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 41
normal! 0
lcd ~/.local/git/in-house/in-house-web
wincmd w
wincmd =
if exists(':tcd') == 2 | tcd ~/.local/git/in-house/in-house-web | endif
badd +30 ~/.local/git/in-house/in-house-web/src/pages/polls.jsx
badd +41 ~/.local/git/in-house/in-house-web/src/store/venues/saga/toggleMinkFlag.js
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
