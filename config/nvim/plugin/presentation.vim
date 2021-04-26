augroup presentation
    autocmd!

    " Presentation mode
    au Filetype markdown nmap <buffer> <F5> :PresentingStart<CR>
    au Filetype markdown nmap <buffer> <F6> :PresentingExit<CR>

    " ASCII art
    au Filetype markdown nmap <buffer> <F8> :.!toilet -w 200 -f standard<CR>
    au Filetype markdown nmap <buffer> <F9> :.!toilet -w 200 -f small<CR>
    au Filetype markdown nmap <buffer> <F10> :.!toilet -w 200 -f term -F border<CR>

augroup end
