let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.local/git/joehannes/joehannes.github.io
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd ~/.config/nvim/init.lua
tabnew
tabrewind
edit ~/.config/nvim/lua/config/cmp.lua
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
exe 'vert 1resize ' . ((&columns * 159 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 160 + 160) / 320)
argglobal
balt ~/.config/nvim/lua/settings.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=100
setlocal fml=1
setlocal fdn=20
setlocal fen
19
normal! zo
40
normal! zo
41
normal! zo
149
normal! zo
let s:l = 154 - ((66 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 154
normal! 05|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists("~/.config/nvim/lua/settings.lua") | buffer ~/.config/nvim/lua/settings.lua | else | edit ~/.config/nvim/lua/settings.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/settings.lua
endif
balt ~/.config/nvim/lua/config/auto_session.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 62 - ((38 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 62
normal! 017|
lcd ~/.config/nvim
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 159 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 160 + 160) / 320)
tabnext
edit ~/.local/git/joehannes/joehannes.github.io/src/pages/Welcome.tsx
argglobal
balt ~/.local/git/joehannes/joehannes.github.io/src/pages/Welcome.tsx
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 23 - ((22 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 045|
lcd ~/.local/git/joehannes/joehannes.github.io
tabnext 1
badd +154 ~/.config/nvim/lua/config/cmp.lua
badd +0 ~/.config/nvim/init.lua
badd +62 ~/.config/nvim/lua/settings.lua
badd +1 ~/.config/nvim/lua/config/auto_session.lua
badd +23 ~/.local/git/joehannes/joehannes.github.io/src/pages/Welcome.tsx
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=40 winwidth=120 shortmess=aoO
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
