local M = {}

function M.setup()
  vim.cmd(
    [[
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

    ]],
    false
  )
end

return M
