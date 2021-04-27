let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0

augroup presentation
    autocmd!

    " Presentation mode
    au Filetype markdown nnoremap <buffer> <F10> :PresentingStart<CR>

    " ASCII art
    au Filetype markdown nnoremap <buffer> <F12> :.!toilet -w 200 -f term -F border<CR>

augroup end
