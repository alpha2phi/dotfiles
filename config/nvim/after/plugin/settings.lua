local M = {}

function M.auto_cmds()
  -- Highlight on yank
  -- cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
  vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()"

  vim.cmd [[
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
  ]]

  vim.cmd [[
        set wildmode=longest,list,full
        set wildoptions=pum
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

  -- Terminal
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

  -- Trimming and highlight search
  vim.api.nvim_exec(
    [[
        fun! TrimWhitespace()
            let l:save = winsaveview()
            keeppatterns %s/\s\+$//e
            call winrestview(l:save)
        endfun

        "-- autocmd FileType * autocmd BufWritePre <buffer> call TrimWhitespace()

        nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
    ]],
    false
  )

  -- vim.cmd [[ autocmd CmdWinEnter * quit ]]

  -- Window highlight
  vim.api.nvim_exec(
    [[
      hi InactiveWindow guibg=#282C34
      autocmd VimEnter * set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
    ]],
    false
  )

  -- Copilot
  vim.api.nvim_exec(
    [[
        imap <silent><script><expr> <C-s> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
    ]],
    false
  )

  -- Go to last location
  vim.cmd [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
  ]]

  -- nnoremap g1 <cmd>!tmux new-window vd <cfile><CR>
  -- nnoremap g1 <cmd>vsplit term://vd <cfile><CR>
  -- nnoremap g2 <cmd>lua require("utils.term").send()<CR>
  -- xnoremap g2 <cmd>lua require("utils.term").send(true)<CR>
  -- nnoremap ,r :update<CR>:exec '!python3' shellescape(@%, 1)<CR>
  -- nnoremap ,d :update<CR>:sp term://python3 -m pdb %<CR>
  -- nnoremap ,n :update<CR>:sp term://nodemon -e py %<CR>
  vim.api.nvim_exec(
    [[
      autocmd BufNewFile  test_*.py	0r ~/.config/nvim/snippets/unittest.py
      autocmd BufNewFile  *.html	0r ~/.config/nvim/snippets/html5.html
      xmap <silent> . :normal .<CR>
    ]],
    false
  )
end

function M.setup()
  M.auto_cmds()
end

M.setup()
