local M = {}

function M.dashboard()
    vim.cmd([[
        let g:dashboard_default_executive ='telescope'
        let g:dashboard_custom_footer = ['']
        let g:dashboard_custom_header =<< EOF
                        /\          /\          /\
                        /\//\\/\    /\//\\/\    /\//\\/\
                    /\//\\\///\\/\//\\\///\\/\//\\\///\\/\
                    //\\\//\/\\///\\\//\/\\///\\\//\/\\///\\
                    \\//\/                            \/\\//
                    \/                                  \/
                    /\                                  /\
                    //\\  Neovim IDE with LSP and DAP   //\\
                    \\//                                \\//
                    \/                                  \/
                    /\                                  /\
                    //\\/\                            /\//\\
                    \\///\\/\//\\\///\\/\//\\\///\\/\//\\\//
                    \/\\///\\\//\/\\///\\\//\/\\///\\\//\/
                        \/\\//\/    \/\\//\/    \/\\//\/
                        \/          \/          \/

EOF

        let g:dashboard_custom_shortcut = {'last_session': '<Leader> z l', 'find_history': '<Leader> f x','find_file': '<Leader> f f', 'new_file': '<Leader> f n', 'change_colorscheme' : '<Leader> z c', 'find_word': '<Leader> f g', 'book_marks': '<Leader> f m', }

    ]], false)
end

function M.auto_cmds()
    vim.cmd 'colorscheme gruvbox-material'

    -- Highlight on yank
    -- cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
    vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'

    vim.api.nvim_exec([[
        cnoreabbrev W! w!
        cnoreabbrev Q! q!
        cnoreabbrev Qall! qall!
        cnoreabbrev Wq wq
        cnoreabbrev Wa wa
        cnoreabbrev wQ wq
        cnoreabbrev WQ wq
        cnoreabbrev W w
        cnoreabbrev Q q
        cnoreabbrev Qall qall
    ]], false)

    -- Auto format
    -- vim.api.nvim_exec([[
    -- augroup auto_fmt
    --     autocmd!
    --     autocmd BufWritePre *.py,*.lua,*.rs try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
    -- aug END
    -- ]], false)

    vim.api.nvim_exec([[
        augroup auto_html
            autocmd!
            autocmd Filetype html setlocal ts=2 sw=2 expandtab
            autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
        augroup END
    ]], false)

    vim.api.nvim_exec([[
        augroup auto_term
            autocmd!
            autocmd TermOpen * setlocal nonumber norelativenumber
            autocmd TermOpen * startinsert
        augroup END
    ]], false)

    vim.api.nvim_exec([[
        fun! TrimWhitespace()
            let l:save = winsaveview()
            keeppatterns %s/\s\+$//e
            call winrestview(l:save)
        endfun

        autocmd FileType * autocmd BufWritePre <buffer> call TrimWhitespace()
    ]], false)
end

function M.plugins()
    vim.api.nvim_exec([[
        let g:doge_mapping = "<Leader>gd"

        "let test#strategy = "neovim"
        let test#strategy = "dispatch"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1
        let test#python#runner = 'pyunit'

    ]], false)
end

function M.setup()
    M.dashboard()
    M.auto_cmds()
    M.plugins()
end

return M
