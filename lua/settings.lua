---@diagnostic disable: undefined-global
local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local indent = 2

cmd("syntax enable")
cmd("filetype plugin indent on")

o.qftf = "{info -> v:lua._G.qftf(info)}"
o.termguicolors = true
o.hidden = true
o.ignorecase = true
o.scrolloff = 0
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamed,unnamedplus"
o.timeoutlen = 300
o.updatetime = 300
o.inccommand = "split"
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
wo.number = true
wo.relativenumber = true
wo.cursorline = true
opt.undodir = vim.fn.stdpath("config") .. "/.undo"
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
set updatetime=200
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

-- Git Blame Virtual
vim.api.nvim_exec(
	[[
augroup auto_blame
  autocmd!
  autocmd CursorHold * lua require'utils'.Git.blameVirtText()
  autocmd CursorMoved * lua require'utils'.Git.clearBlameVirtText()
  autocmd CursorMovedI * lua require'utils'.Git.clearBlameVirtText()
augroup END
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
augroup markdown_syntax
  au!
  au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
  au BufNewFile,BufFilePre,BufRead *.MD set filetype=markdown
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

    autocmd FileType go,rust,html,typescript,javascript,python autocmd BufWritePre <buffer> call TrimWhitespace()

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
