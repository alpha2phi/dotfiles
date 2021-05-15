vim.api.nvim_exec([[
augroup pythondebug
  autocmd!

  autocmd FileType python map <buffer> <F9> :update<CR>:sp term://nodemon -e py %<CR>
  autocmd FileType python imap <buffer> <F9> <esc>:update<CR>:sp term://nodemon -e py %<CR>

  autocmd FileType python map <buffer> <Leader>dr :update<CR>:exec '!python' shellescape(@%, 1)<CR>
  autocmd FileType python map <buffer> <Leader>dd :update<CR>:sp term://python -m pdb %<CR>

augroup END
]], false)

vim.api.nvim_exec([[
augroup rustdebug
  autocmd!

  autocmd FileType rust map <buffer> <Leader>dr :update<CR>:Cargo run<CR>
  autocmd FileType rust map <buffer> <Leader>dd :update<CR>:RustRun<CR>
  autocmd FileType rust packadd termdebug

augroup END
]], false)

