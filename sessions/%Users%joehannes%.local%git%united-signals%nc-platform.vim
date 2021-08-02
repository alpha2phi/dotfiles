let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +377 ~/.local/git/united-signals/nc-platform/resources/css/tailwind.css
badd +33 ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/data_model/view.cljs
badd +12 ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/common/video.cljs
argglobal
%argdel
edit ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/data_model/view.cljs
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
wincmd =
argglobal
balt ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/ui_component/layout.cljs
let s:l = 33 - ((26 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 062|
wincmd w
argglobal
if bufexists("~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/common/video.cljs") | buffer ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/common/video.cljs | else | edit ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/common/video.cljs | endif
if &buftype ==# 'terminal'
  silent file ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/common/video.cljs
endif
balt ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/data_model/common/events.cljs
let s:l = 12 - ((11 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 09|
wincmd w
argglobal
if bufexists("~/.local/git/united-signals/nc-platform/resources/css/tailwind.css") | buffer ~/.local/git/united-signals/nc-platform/resources/css/tailwind.css | else | edit ~/.local/git/united-signals/nc-platform/resources/css/tailwind.css | endif
if &buftype ==# 'terminal'
  silent file ~/.local/git/united-signals/nc-platform/resources/css/tailwind.css
endif
balt ~/.local/git/united-signals/nc-platform/src/cljs/nc_platform/feature/common/navigation.cljs
let s:l = 380 - ((72 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 380
normal! 049|
wincmd w
wincmd =
if exists(':tcd') == 2 | tcd ~/.local/git/united-signals/nc-platform | endif
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
