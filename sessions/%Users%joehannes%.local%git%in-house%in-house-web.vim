let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.local/git/in-house/in-house-web
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd ~/.config/nvim/init.lua
edit src/pages/polls.jsx
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
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
exe 'vert 1resize ' . ((&columns * 144 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 144 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 30 + 160) / 320)
argglobal
balt src/pages/houses.jsx
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 34 - ((33 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 34
normal! 0
wincmd w
argglobal
if bufexists("src/store/venues/saga/toggleMinkFlag.js") | buffer src/store/venues/saga/toggleMinkFlag.js | else | edit src/store/venues/saga/toggleMinkFlag.js | endif
if &buftype ==# 'terminal'
  silent file src/store/venues/saga/toggleMinkFlag.js
endif
balt src/store/venues/selectors.js
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=100
setlocal fml=1
setlocal fdn=20
setlocal fen
16
normal! zo
19
normal! zo
31
normal! zo
32
normal! zo
let s:l = 24 - ((23 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 24
normal! 0
lcd ~/.local/git/in-house/in-house-web
wincmd w
argglobal
enew
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/.local/git/in-house/in-house-web
wincmd w
exe 'vert 1resize ' . ((&columns * 144 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 144 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 30 + 160) / 320)
if exists(':tcd') == 2 | tcd ~/.local/git/in-house/in-house-web | endif
tabnext 1
badd +34 ~/.local/git/in-house/in-house-web/src/pages/polls.jsx
badd +0 ~/.config/nvim/init.lua
badd +0 ~/.local/git/in-house/in-house-web/src/pages/houses.jsx
badd +24 ~/.local/git/in-house/in-house-web/src/store/venues/saga/toggleMinkFlag.js
badd +0 ~/.local/git/in-house/in-house-web/src/store/venues/selectors.js
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
