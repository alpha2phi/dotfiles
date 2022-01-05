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
edit ~/.config/nvim/lua/plugins.lua
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
balt ~/.config/nvim/lua/keymappings.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=8
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 44 - ((43 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 44
normal! 010|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists("~/.config/nvim/plugin/doge.vim") | buffer ~/.config/nvim/plugin/doge.vim | else | edit ~/.config/nvim/plugin/doge.vim | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/plugin/doge.vim
endif
balt ~/.config/nvim/lua/plugins.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 10 - ((9 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 018|
lcd ~/.config/nvim
wincmd w
argglobal
enew
balt ~/.config/nvim/lua/plugins.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/.config/nvim
wincmd w
exe 'vert 1resize ' . ((&columns * 144 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 144 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 30 + 160) / 320)
if exists(':tcd') == 2 | tcd ~/.config/nvim | endif
tabnext
edit ~/.local/git/joehannes/joehannes.github.io/src/pages/WorkExperience.tsx
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '2resize ' . ((&lines * 3 + 40) / 80)
exe 'vert 2resize ' . ((&columns * 50 + 160) / 320)
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=8
setlocal fml=1
setlocal fdn=20
setlocal fen
22
normal! zo
let s:l = 33 - ((32 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 014|
lcd ~/.local/git/joehannes/joehannes.github.io
wincmd w
argglobal
enew
balt ~/.local/git/joehannes/joehannes.github.io/src/pages/WorkExperience.tsx
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/.local/git/joehannes/joehannes.github.io
wincmd w
exe '2resize ' . ((&lines * 3 + 40) / 80)
exe 'vert 2resize ' . ((&columns * 50 + 160) / 320)
tabnext 2
badd +1 ~/.config/nvim/lua/plugins.lua
badd +125 ~/.config/nvim/init.lua
badd +33 ~/.local/git/joehannes/joehannes.github.io/src/pages/WorkExperience.tsx
badd +1 ~/.config/nvim/lua/keymappings.lua
badd +1 ~/.config/nvim/plugin/doge.vim
badd +10 ~/.config/nvim/README.md
badd +121 ~/.config/nvim/lua/config/colorschemes.lua
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
