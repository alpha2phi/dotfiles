local M = {}

local lsputils = require("config.lsp.utils")

CONFIG = {}

function M.setup()
    lsputils.setup_server("python", CONFIG)
    M.autocmds()
    M.keymappings()
end

function M.autocmds()
    vim.api.nvim_exec([[

      augroup PYTHON
        autocmd!

        autocmd FileType python map <buffer> <Leader>rw :update<CR>:sp term://nodemon -e py %<CR>
        autocmd FileType python imap <buffer> <Leader>rw <esc>:update<CR>:sp term://nodemon -e py %<CR>

        autocmd FileType python map <buffer> <Leader>rr :update<CR>:exec '!python3' shellescape(@%, 1)<CR>
        autocmd FileType python map <buffer> <Leader>rd :update<CR>:sp term://python3 -m pdb %<CR>

        autocmd FileType python map <buffer> <Leader>rl :update<CR>:exec '!python3'<CR>

        autocmd FileType python map <buffer> <Leader>ro :PyrightOrganizeImports<CR>
      augroup END

    ]], false)
end

function M.keymappings()
    local opts = {
        mode = "n",
        prefix = "<leader>",
        buffer = nil,
        silent = false,
        noremap = true,
        nowait = true
    }

    local wk = require("which-key")
    local mappings = {
        ["rr"] = {name = "Run"},
        ["rd"] = {name = "PDB Debug"},
        ["rw"] = {name = "Nodemon watch"},
        ["rc"] = {name = "Organize imports"},
        ["rl"] = {name = "REPL"}
    }
    wk.register(mappings, opts)

end

return M
