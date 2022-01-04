let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd init.lua
edit lua/plugins.lua
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
exe 'vert 1resize ' . ((&columns * 0 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 319 + 160) / 320)
exe '3resize ' . ((&lines * 3 + 40) / 80)
exe 'vert 3resize ' . ((&columns * 10 + 160) / 320)
exe '4resize ' . ((&lines * 3 + 40) / 80)
exe 'vert 4resize ' . ((&columns * 4 + 160) / 320)
argglobal
balt README.md
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=8
setlocal fml=1
setlocal fdn=20
setlocal fen
4
normal! zo
5
normal! zo
let s:l = 94 - ((60 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 94
normal! 02|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists("~/.config/nvim/lua/config/colorschemes.lua") | buffer ~/.config/nvim/lua/config/colorschemes.lua | else | edit ~/.config/nvim/lua/config/colorschemes.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/config/colorschemes.lua
endif
balt ~/.config/nvim/lua/plugins.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 67 - ((66 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 67
normal! 019|
wincmd w
argglobal
enew
balt ~/.config/nvim/lua/config/colorschemes.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
enew
balt ~/.config/nvim/lua/config/colorschemes.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 0 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 319 + 160) / 320)
exe '3resize ' . ((&lines * 3 + 40) / 80)
exe 'vert 3resize ' . ((&columns * 10 + 160) / 320)
exe '4resize ' . ((&lines * 3 + 40) / 80)
exe 'vert 4resize ' . ((&columns * 4 + 160) / 320)
if exists(':tcd') == 2 | tcd ~/.config/nvim | endif
tabnext 1
badd +150 ~/.config/nvim/lua/plugins.lua
badd +0 ~/.config/nvim/init.lua
badd +0 ~/.config/nvim/README.md
badd +67 ~/.config/nvim/lua/config/colorschemes.lua
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=43 winwidth=120 shortmess=filnxtToOFc
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
