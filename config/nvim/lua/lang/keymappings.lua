local utils = require('utils')

utils.map('n', '<leader>lo', '<cmd>Telescope lsp_document_symbols<CR>')
utils.map('n', '<leader>lq', '<cmd>Telescope quickfix<CR>')

vim.api.nvim_exec([[
augroup pythondebug
  autocmd!

  autocmd FileType python map <buffer> <Leader>dn :update<CR>:sp term://nodemon -e py %<CR>
  autocmd FileType python imap <buffer> <Leader>dn <esc>:update<CR>:sp term://nodemon -e py %<CR>

  autocmd FileType python map <buffer> <Leader>dp :update<CR>:exec '!python' shellescape(@%, 1)<CR>
  autocmd FileType python map <buffer> <Leader>dd :update<CR>:sp term://python -m pdb %<CR>

augroup END
]], false)

vim.api.nvim_exec([[
augroup rustdebug
  autocmd!

  autocmd FileType rust map <buffer> <Leader>lrc :update<CR>:Cargo run<CR>
  autocmd FileType rust map <buffer> <Leader>lrr :update<CR>:RustRun<CR>
  autocmd FileType rust packadd termdebug

  autocmd FileType rust map <buffer> <Leader>lra :update<CR>:RustRunnables<CR>
  autocmd FileType rust map <buffer> <Leader>lrd :update<CR>:RustDebuggables<CR>

augroup END
]], false)

