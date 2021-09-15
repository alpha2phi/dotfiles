local M = {}

function M.auto_cmds()
  vim.cmd "colorscheme gruvbox-material"

  -- Highlight on yank
  -- cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
  vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()"

  vim.cmd [[
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
    ]]

  -- don't auto commenting new lines
  vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

  vim.api.nvim_exec(
    [[
        cnoreabbrev W! w!
        cnoreabbrev Q! q!
        cnoreabbrev Qall! qall!
        cnoreabbrev Wq wq
        cnoreabbrev Wa wa
        cnoreabbrev wQ wq
        cnoreabbrev WQ wq
        cnoreabbrev W w
        cnoreabbrev Q q
        cnoreabbrev Qall qall
    ]],
    false
  )

  -- Auto format
  -- vim.api.nvim_exec([[
  -- augroup auto_fmt
  --     autocmd!
  --     autocmd BufWritePre *.py,*.lua,*.rs try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  -- aug END
  -- ]], false)

  vim.api.nvim_exec(
    [[
        augroup auto_html
            autocmd!
            autocmd Filetype html setlocal ts=2 sw=2 expandtab
            autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
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
        fun! TrimWhitespace()
            let l:save = winsaveview()
            keeppatterns %s/\s\+$//e
            call winrestview(l:save)
        endfun

        "-- autocmd FileType * autocmd BufWritePre <buffer> call TrimWhitespace()
    ]],
    false
  )
end

function M.setup()
  M.auto_cmds()
end

return M
