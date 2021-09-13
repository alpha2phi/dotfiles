local M = {}

function M.register()
    vim.api.nvim_exec([[

      augroup PYTHON
        autocmd!

        autocmd FileType python map <buffer> <Leader>rm :update<CR>:sp term://nodemon -e py %<CR>
        autocmd FileType python imap <buffer> <Leader>rm <esc>:update<CR>:sp term://nodemon -e py %<CR>

        autocmd FileType python map <buffer> <Leader>rr :update<CR>:exec '!python' shellescape(@%, 1)<CR>
        autocmd FileType python map <buffer> <Leader>rd :update<CR>:sp term://python -m pdb %<CR>

        autocmd FileType python map <buffer> <Leader>ro :PyrightOrganizeImports<CR>
      augroup END

    ]], false)

    vim.api.nvim_exec([[

      augroup RUST
        autocmd!

        autocmd FileType rust map <buffer> <Leader>rc :update<CR>:Cargo run<CR>
        autocmd FileType rust map <buffer> <Leader>rr :update<CR>:RustRun<CR>
        autocmd FileType rust packadd termdebug

        autocmd FileType rust map <buffer> <Leader>rl :update<CR>:RustRunnables<CR>
        autocmd FileType rust map <buffer> <Leader>rd :update<CR>:RustDebuggables<CR>

        autocmd FileType rust map <buffer> <Leader>rm :update<CR>:sp term://cargo watch -s 'clear && cargo run -q'<CR>
        autocmd FileType rust imap <buffer> <Leader>rm <esc>:update<CR>:sp term://cargo watch -s 'clear && cargo run -q'<CR>
      augroup END


    ]], false)

    local whichkey = require("config.which-key")

end

return M
