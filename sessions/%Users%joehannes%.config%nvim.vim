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
edit ~/.config/nvim/lua/global.lua
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
exe 'vert 1resize ' . ((&columns * 120 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 120 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 78 + 160) / 320)
argglobal
balt ~/.config/nvim/lua/lang/init.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
79
normal! zo
let s:l = 61 - ((38 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 61
normal! 012|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists("~/.config/nvim/lua/config/aerial.lua") | buffer ~/.config/nvim/lua/config/aerial.lua | else | edit ~/.config/nvim/lua/config/aerial.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/config/aerial.lua
endif
balt ~/.config/nvim/lua/plugins.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 9 - ((8 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 012|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists("~/.config/nvim/lua/keymappings.lua") | buffer ~/.config/nvim/lua/keymappings.lua | else | edit ~/.config/nvim/lua/keymappings.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/keymappings.lua
endif
balt ~/.config/nvim/lua/lang/init.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=11
setlocal fml=1
setlocal fdn=20
setlocal fen
5
normal! zo
37
normal! zo
let s:l = 3 - ((2 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 028|
lcd ~/.config/nvim
wincmd w
exe 'vert 1resize ' . ((&columns * 120 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 120 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 78 + 160) / 320)
tabnext
edit ~/.local/git/joehannes/joehannes.github.io/src/pages/Welcome.tsx
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
11
normal! zo
let s:l = 24 - ((23 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 24
normal! 0
lcd ~/.local/git/joehannes/joehannes.github.io
tabnext 2
badd +61 ~/.config/nvim/lua/global.lua
badd +12 ~/.config/nvim/init.lua
badd +1 ~/.local/git/joehannes/joehannes.github.io/src/pages/Welcome.tsx
badd +77 ~/.config/nvim/lua/lang/init.lua
badd +54 ~/.config/nvim/lua/plugins.lua
badd +2 ~/.config/nvim/lua/keymappings.lua
badd +68 ~/.config/nvim/lua/settings.lua
badd +1 ~/.config/nvim/lua/config/cmp.lua
badd +1 ~/.config/nvim/lua/config/auto_session.lua
badd +2 ~/.config/nvim/lua/config/aerial.lua
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
