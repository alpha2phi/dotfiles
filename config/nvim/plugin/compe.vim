inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

augroup TelescopeNoCompletion
  autocmd!
  autocmd FileType TelescopePrompt let g:compe.enabled = v:false
  autocmd BufLeave,FocusLost,InsertEnter   TelescopePrompt let g:compe.enabled = v:true
augroup END

