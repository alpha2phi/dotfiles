---@diagnostic disable: undefined-global
local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local indent = 2

cmd("syntax enable")
cmd("filetype plugin indent on")

o.qftf = "{info -> v:lua.qftf(info)}"
o.termguicolors = true
o.hidden = true
o.ignorecase = true
o.scrolloff = 7
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamed,unnamedplus"
o.timeoutlen = 300
o.updatetime = 300
o.inccommand = "split"
o.sessionoptions = "globals,resize,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
o.undofile = true
o.foldlevelstart = 1
wo.number = true
wo.relativenumber = true
wo.cursorline = true
wo.signcolumn = "auto:3"
opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.expandtab = true
opt.list = true
opt.listchars:append("eol:↴")

cmd([[
  set colorcolumn=80,100,120
  set cursorcolumn
  set expandtab smarttab shiftround autoindent smartindent smartcase
  set path+=**
  set wildmode=longest,list,full
  set wildmenu
  set wildignore+=*.pyc
  set wildignore+=*_build/*
  set wildignore+=**/coverage/*
  set wildignore+=**/node_modules/*
  set wildignore+=**/android/*
  set wildignore+=**/ios/*
  set wildignore+=**/.git/*
  set ruler
  set number relativenumber
  set guifont=FiraCode\ Nerd\ Font\ Mono
  set showtabline=2
  set laststatus=3
  set directory=/tmp
  set nobackup
  set nowritebackup
  set noswapfile
  set nocompatible
  set noequalalways
  set hidden
  set encoding=utf-8
  set ea
  set cmdheight=0
  set updatetime=300
  set shortmess+=c
  set mouse=a mousemodel=popup
  set guioptions-=e
  set viewoptions-=options
  set foldlevelstart=1
]])

cmd('let g:Powerline_symbols = "fancy"')

-- Highlight on yank
cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", hlgroup=IncSearch, timeout=300}]])

-- this seems like something I don't need any longer
-- cmd([[autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif]])

-- https://github.com/mhinz/vim-grepper
vim.g.grepper = { tools = { "rg", "grep" }, searchreg = 1 }
vim.api.nvim_create_augroup("MyColorAugroup", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = onModeChanged,
  group = "MyColorAugroup",
})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = onColorscheme,
  group = "MyColorAugroup",
})

cmd(([[
    aug Grepper
        au!
        au User Grepper ++nested %s
    aug END
]]):format([[call setloclist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))

-- Auto format
vim.api.nvim_exec(
  [[
augroup auto_fmt
    autocmd!
    autocmd BufWritePre *.clj,*.cljc,*.cljs CljFmt
aug END
]] ,
  false
)

vim.api.nvim_exec(
  [[
augroup auto_spellcheck
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal spell
    autocmd BufNewFile,BufRead *.org setfiletype markdown
    autocmd BufNewFile,BufRead *.org setlocal spell
augroup END
]] ,
  false
)

vim.api.nvim_exec(
  [[
augroup auto_term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * startinsert
augroup END
]] ,
  false
)

vim.api.nvim_exec(
  [[
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
]] ,
  false
)

vim.api.nvim_exec(
  [[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
]] ,
  false
)

vim.api.nvim_exec(
  [[
  augroup remember_folds
    autocmd!
    autocmd BufWinEnter *.ts silent loadview
    autocmd BufWinEnter *.tsx silent loadview
    autocmd BufWinEnter *.js silent loadview
    autocmd BufWinEnter *.jsx silent loadview
    autocmd BufWinEnter *.json silent loadview
    autocmd BufWinLeave *.js mkview
    autocmd BufWinLeave *.jsx mkview
    autocmd BufWinLeave *.ts mkview
    autocmd BufWinLeave *.tsx mkview
    autocmd BufWinLeave *.json mkview
  augroup END
  ]],
  false
)

vim.api.nvim_exec(
  [[
    function! WinMove(key)
        let t:curwin = winnr()
        exec "wincmd ".a:key
        if (t:curwin == winnr())
            if (match(a:key,'[jk]'))
                wincmd v
            else
                wincmd s
            endif
            exec "wincmd ".a:key
        endif
    endfunction
]] ,
  false
)

cmd([[
  let g:python_host_prog = "/usr/bin/python2"
  let g:python3_host_prog = "python"

	let g:minimap_width = 21
	let g:minimap_auto_start = 0
	let g:minimap_auto_start_win_enter = 0
	let g:minimap_git_colors = 1

  set termguicolors

	function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
	endfunction

	function! ToggleQuickLoc()
    if empty(filter(getwininfo(), 'v:val.loclist'))
      lopen
    else
      lclose
    endif
	endfunction

  function! ToggleDiagFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        lua require("diaglist").open_all_diagnostics()
    else
        cclose
    endif
	endfunction

	function! ToggleDiagLoc()
    if empty(filter(getwininfo(), 'v:val.loclist'))
      lua require("diaglist").open_buffer_diagnostics()
    else
      lclose
    endif
	endfunction

]])
