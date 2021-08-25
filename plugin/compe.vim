augroup TelescopeNoCompletion
  autocmd!
  autocmd FileType TelescopePrompt let g:compe.enabled = v:false
  autocmd BufLeave,FocusLost,InsertEnter   TelescopePrompt let g:compe.enabled = v:true
augroup END

