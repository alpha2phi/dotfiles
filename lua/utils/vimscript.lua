vim.cmd([[
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

  function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
	endfunction

	function! ToggleLocList()
    if empty(filter(getwininfo(), 'v:val.loclist'))
      lopen
    else
      lclose
    endif
	endfunction

  function! ToggleDiagQF()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        lua require("diaglist").open_all_diagnostics()
    else
        cclose
    endif
	endfunction

	function! ToggleDiagLL()
    if empty(filter(getwininfo(), 'v:val.loclist'))
      lua require("diaglist").open_buffer_diagnostics()
    else
      lclose
    endif
	endfunction
]])
