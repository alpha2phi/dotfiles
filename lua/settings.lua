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
set hidden
set encoding=utf-8
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set mouse=a mousemodel=popup
set guioptions-=e
]])

cmd('let g:Powerline_symbols = "fancy"')

-- Highlight on yank
cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

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

	function! ToggleBackgroundLightness()
    if &background ==# 'dark'
        set background=light
        lua require("indent_guides").setup({ even_colors = { fg = "#FC5C94", bg = "#FC5C94" }, odd_colors = { fg = "#333333", bg = "#333333" }, indent_guide_size = 1 })
    else
        set background=dark
				lua require("indent_guides").setup({ even_colors = { fg = "#5d4d7a", bg = "#5d4d7a" }, odd_colors = { fg = "#cdcdcd", bg = "#cdcdcd" }, indent_guide_size = 1 })
    endif
    lua require("config/bufferline").setup()
	endfunction
]])
