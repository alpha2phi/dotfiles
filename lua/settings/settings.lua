local M = [[
  syntax enable
  filetype plugin indent on
  set shell=/bin/zsh
  set colorcolumn=80,100,120
  set cursorcolumn
  set termguicolors
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
  set showtabline=1
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
]]

return M
