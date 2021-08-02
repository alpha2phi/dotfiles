augroup change_colorscheme
    autocmd!
    autocmd User ProjectionistActivate call s:change_colorscheme() 
augroup END

function! s:change_colorscheme() abort
    let l:colorscheme = projectionist#query('colorscheme') 
    if len(l:colorscheme) > 0
        execute 'colorscheme '.l:colorscheme[0][1][0]
    endif
endfunction
