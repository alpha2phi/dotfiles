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
o.scrolloff = 21
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamed,unnamedplus"
o.timeoutlen = 300
o.updatetime = 300
o.inccommand = "split"
o.sessionoptions = "globals,resize,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
o.undofile = true
wo.number = true
wo.relativenumber = true
wo.cursorline = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.expandtab = true

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
  set laststatus=2
  set directory=/tmp
  set nobackup
  set nowritebackup
  set noswapfile
  set nocompatible
  set noequalalways
  set hidden
  set encoding=utf-8
  set cmdheight=2
  set updatetime=300
  set shortmess+=c
  set signcolumn=yes
  set mouse=a mousemodel=popup
  set guioptions-=e
]])

cmd('let g:Powerline_symbols = "fancy"')

-- Highlight on yank
cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", hlgroup=IncSearch, timeout=300}]])

cmd([[autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif]])

-- Auto format
vim.api.nvim_exec(
	[[
augroup auto_fmt
    autocmd!
    autocmd BufWritePre *.clj,*.cljc,*.cljs CljFmt
aug END
]],
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
]],
	false
)

vim.api.nvim_exec(
	[[
augroup auto_term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * startinsert
augroup END
]],
	false
)

vim.api.nvim_exec(
	[[
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
]],
	false
)

vim.api.nvim_exec(
	[[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
]],
	false
)

vim.api.nvim_exec(
	[[
augroup foldMethodSetLocal
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave *.clj setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.cljc setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.cljs setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.json setlocal foldmethod=indent
augroup END
]],
	false
)

vim.api.nvim_exec(
	[[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
  ]],
	false
)

vim.api.nvim_exec(
	[[
  augroup my_scope_and_focus
    autocmd!
    autocmd ColorScheme * lua require"utils".Color.vim.highlight_blend_bg("GitSignsAddLn", 21, "#AAFFAA")
    autocmd ColorScheme * lua require"utils".Color.vim.highlight_blend_bg("GitSignsChangeLn", 21, "#FFFFAA")
    autocmd ColorScheme * lua require"utils".Color.vim.highlight_blend_bg("GitSignsDeleteLn", 50, "#FFAAAA")
    autocmd ColorScheme * lua require"utils".Color.vim.highlight_blend_bg("TSCurrentScope", 10, "#00AFFF")
    autocmd ColorScheme * lua require"utils".Color.vim.highlight_blend_bg("CursorLine", 21, "#FF00AF")
    autocmd ColorScheme * lua require"utils".Color.vim.highlight_blend_bg("CursorColumn", 21, "#FF00AF")
    autocmd ColorScheme * lua require"utils".Color.vim.highlight_blend_bg("Visual", 21, "#FF00AF")
  augroup END
  ]],
	false
)

vim.api.nvim_exec(
	[[
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    autocmd FileType go,rust,html,typescript,typescriptreact,javascript,javascriptreact,python autocmd BufWritePre <buffer> call TrimWhitespace()

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
]],
	false
)

cmd([[
  let g:python_host_prog = "/usr/bin/python2"
  let g:python3_host_prog = "/usr/bin/python3"

	let g:minimap_width = 21
	let g:minimap_auto_start = 0
	let g:minimap_auto_start_win_enter = 0
	let g:minimap_git_colors = 1

  let g:nd_themes = [
    \ ['sunrise+0',   'themer_gruvbox', 'dark' ],
    \ ['sunrise+1/5',   'PaperColor', 'light' ],
    \ ['sunrise+1/2', 'kat.lightenwim', 'light' ],
    \ ['sunrise+4/5', 'earlysummer_lighter', 'dark' ],
    \ ['sunset+0',    'monokai_ristretto', 'dark'  ],
    \ ['sunset+1/5',    'themer_kurai', 'dark'  ],
    \ ['sunset+1/2',    'themer_dracula', 'dark'  ],
    \ ['sunset+2/3',    'themer_rose_pine', 'dark'  ],
    \ ]
  let g:nd_latitude = 20
  let g:nd_timeshift = 34

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
