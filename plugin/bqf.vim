function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

function! ToggleQuickLoc()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lopen
    else
        lclose
    endif
endfunction

nnoremap <silent> <leader>tqf :call ToggleQuickFix()<cr>
nnoremap <silent> <leader>tql :call ToggleQuickLoc()<cr>
