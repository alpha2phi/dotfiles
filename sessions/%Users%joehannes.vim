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
edit ~/.config/nvim/lua/config/minimap.lua
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
exe 'vert 1resize ' . ((&columns * 156 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 163 + 160) / 320)
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((7 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 012|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists("~/.config/nvim/lua/config/colorschemes.lua") | buffer ~/.config/nvim/lua/config/colorschemes.lua | else | edit ~/.config/nvim/lua/config/colorschemes.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/config/colorschemes.lua
endif
balt ~/.config/nvim/plugin/doge.vim
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 145 - ((144 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 145
normal! 0
lcd ~/.config/nvim
wincmd w
exe 'vert 1resize ' . ((&columns * 156 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 163 + 160) / 320)
tabnext 1
badd +8 ~/.config/nvim/lua/config/minimap.lua
badd +12 ~/.config/nvim/init.lua
badd +247 ~/.config/nvim/lua/keymappings.lua
badd +39 ~/.config/nvim/lua/plugins.lua
badd +12 ~/.config/nvim/lua/config/scrollbar.lua
badd +9 ~/.config/nvim/lua/config/copilot.lua
badd +17 ~/.config/nvim/lua/config/aerial.lua
badd +33 ~/.local/git/joehannes/joehannes.github.io/src/pages/WorkExperience.tsx
badd +12 ~/.config/nvim/plugin/doge.vim
badd +146 ~/.config/nvim/lua/config/colorschemes.lua
badd +15 ~/.config/nvim/lua/settings.lua
badd +1 ~/.config/nvim/lua/config/trouble.lua
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=1 shortmess=aoO
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
