let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
let EditorConfig_verbose =  0 
let SignatureMarkerTextHLDynamic =  0 
let CheatSheetShowCommentsByDefault =  1 
let CheatSheetDefaultSelection = "line"
let Hexokinase_termDisabled =  0 
let EditorConfig_exec_path = ""
let SignatureMarkTextHL = "SignatureMarkText"
let Hexokinase_optOutPatterns = ""
let CheatSheetBaseUrl = "https://cht.sh"
let Hexokinase_signIcon = "■"
let CheatPager = "less -R"
let Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla,colour_names"
let Illuminate_highlightPriority =  -1 
let EditorConfig_softtabstop_tab =  1 
let SignatureMarkOrder = "pm"
let SignatureDeferPlacement =  1 
let EditorConfig_max_line_indicator = "line"
let Hexokinase_virtualText = "■"
let SignaturePeriodicRefresh =  1 
let SignatureMarkerLineHL = "SignatureMarkerLine"
let SignatureIncludeMarks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let SignatureErrorIfNoAvailableMarks =  1 
let SignatureIncludeMarkers = ")!@#$%^&*("
let Illuminate_highlightUnderCursor =  1 
let Illuminate_delay =  0 
let CheatSheetUrlGetter = "curl --silent"
let SignatureMarkTextHLDynamic =  0 
let SignatureEnabledAtStartup =  1 
let Hexokinase_executable_path = "/Users/joehannes/.local/share/nvim/site/pack/packer/start/vim-hexokinase/hexokinase/hexokinase"
let CheatSheetReaderCmd = "new"
let EditorConfig_preserve_formatoptions =  0 
let Hexokinase_v2 =  1 
let SignatureWrapJumps =  1 
let SignatureMarkerTextHL = "SignatureMarkerText"
let Powerline_symbols = "fancy"
let SessionLoad =  1 
let SignatureForceMarkerPlacement =  0 
let SignatureForceMarkPlacement =  0 
let NetrwMenuPriority =  80 
let CheatSheetDefaultMode =  0 
let SignatureMarkLineHL = "SignatureMarkLine"
let CheatSheetUrlSettings = "q"
let SignatureForceRemoveGlobal =  0 
let SignaturePrioritizeMarks =  1 
let SignaturePurgeConfirmation =  0 
let EditorConfig_softtabstop_space =  1 
let NetrwTopLvlMenu = "Netrw."
let SignatureDeleteConfirmation =  0 
let CheatSheetStayInOrigBuf =  1 
let CheatSheetFt = "markdown"
let CheatSheetBufferName = "_cheat"
let SignatureRecycleMarks =  0 
silent only
silent tabonly
cd ~/.local/git/joehannes-os/neovim-lua-config
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +21 lua/utils/aucmd.lua
badd +58 lua/plugins/init.lua
badd +42 init.lua
badd +1 lua/plugins/aerial.lua
badd +1 lua/plugins/auto_session.lua
badd +1 lua/plugins/autopairs.lua
badd +1 lua/plugins/bqf.lua
badd +1 lua/plugins/bufferline.lua
badd +1 lua/plugins/codicons.lua
badd +1 lua/plugins/colorizer.lua
badd +1 lua/plugins/completion.lua
badd +1 lua/plugins/copilot.lua
badd +48 lua/plugins/dap.lua
badd +1 lua/plugins/devicon.lua
badd +1 lua/plugins/diffview.lua
badd +1 lua/plugins/dusktildawn.lua
badd +1 lua/plugins/formatter.lua
badd +1 lua/plugins/heirline.lua
badd +1 lua/plugins/hlslens.lua
badd +1 lua/plugins/iron.lua
badd +1 lua/plugins/lightbulb.lua
badd +1 lua/plugins/lspcolors.lua
badd +1 lua/plugins/lspkind.lua
badd +1 lua/plugins/lspsaga.lua
badd +1 lua/plugins/lsputils.lua
badd +1 lua/plugins/navigator.lua
badd +1 lua/plugins/neoclip.lua
badd +1 lua/plugins/notify.lua
badd +1 lua/plugins/onedark.lua
badd +1 lua/plugins/scroll.lua
badd +1 lua/plugins/scrollbar.lua
badd +1 lua/plugins/snippets.lua
badd +1 lua/plugins/sniprun.lua
badd +1 lua/plugins/starry.lua
badd +1 lua/plugins/symbols_outline.lua
badd +157 lua/plugins/telescope.lua
badd +1 lua/plugins/tokyonight.lua
badd +1 lua/plugins/treesitter.lua
badd +1 lua/plugins/trouble.lua
badd +1 lua/plugins/ultest.lua
badd +1 lua/plugins/wilder.lua
badd +1 lua/plugins/zen.lua
badd +4 lua/lang/init.lua
badd +1 lua/init.lua
badd +1257 lua/plugins.lua
badd +11 lua/keymappings/normal.lua
badd +15 lua/utils/fs.lua
badd +25 ~/.vim/tasks.ini
argglobal
%argdel
set lines=74 columns=274
edit lua/utils/aucmd.lua
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
balt lua/plugins/init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 21 - ((20 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 21
normal! 040|
lcd ~/.local/git/joehannes-os/neovim-lua-config
wincmd w
argglobal
if bufexists(fnamemodify("~/.local/git/joehannes-os/neovim-lua-config/lua/plugins/init.lua", ":p")) | buffer ~/.local/git/joehannes-os/neovim-lua-config/lua/plugins/init.lua | else | edit ~/.local/git/joehannes-os/neovim-lua-config/lua/plugins/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.local/git/joehannes-os/neovim-lua-config/lua/plugins/init.lua
endif
balt ~/.local/git/joehannes-os/neovim-lua-config/lua/plugins/dap.lua
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 58 - ((56 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 58
normal! 013|
lcd ~/.local/git/joehannes-os/neovim-lua-config
wincmd w
argglobal
if bufexists(fnamemodify("~/.local/git/joehannes-os/neovim-lua-config/lua/keymappings/normal.lua", ":p")) | buffer ~/.local/git/joehannes-os/neovim-lua-config/lua/keymappings/normal.lua | else | edit ~/.local/git/joehannes-os/neovim-lua-config/lua/keymappings/normal.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.local/git/joehannes-os/neovim-lua-config/lua/keymappings/normal.lua
endif
balt ~/.local/git/joehannes-os/neovim-lua-config/lua/plugins/init.lua
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 11 - ((10 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 05|
lcd ~/.local/git/joehannes-os/neovim-lua-config
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
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
