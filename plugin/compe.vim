inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <A-j>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <A-k>     compe#scroll({ 'delta': -4 })

augroup TelescopeNoCompletion
  autocmd!
  autocmd FileType TelescopePrompt let g:compe.enabled = v:false
  autocmd BufLeave,FocusLost,InsertEnter   TelescopePrompt let g:compe.enabled = v:true
augroup END

