local M = {}

local lsputils = require("config.lsp.utils")

CONFIG = {}

function M.setup()
    require('rust-tools').setup({
        server = {
            capabilities = lsputils.get_capabilities(),
            on_attach = lsputils.lsp_attach,
            on_init = lsputils.lsp_init,
            on_exit = lsputils.lsp_exit,
            flags = {debounce_text_changes = 150}
        }
    })

    M.autocmds()
    M.keymappings()
end

function M.autocmds()
    vim.api.nvim_exec([[

      augroup RUST
        autocmd!

        autocmd FileType rust map <buffer> <Leader>rc :update<CR>:Cargo run<CR>
        autocmd FileType rust map <buffer> <Leader>rr :update<CR>:RustRun<CR>
        autocmd FileType rust packadd termdebug

        autocmd FileType rust map <buffer> <Leader>rl :update<CR>:RustRunnables<CR>
        autocmd FileType rust map <buffer> <Leader>rd :update<CR>:RustDebuggables<CR>

        autocmd FileType rust map <buffer> <Leader>rw :update<CR>:sp term://cargo watch -s 'clear && cargo run -q'<CR>
        autocmd FileType rust imap <buffer> <Leader>rw <esc>:update<CR>:sp term://cargo watch -s 'clear && cargo run -q'<CR>
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
    local iopts = {
        mode = "i",
        prefix = "<leader>",
        buffer = nil,
        silent = false,
        noremap = true,
        nowait = true
    }

    local wk = require("which-key")
    local mappings = {
        ["rc"] = {name = "Cargo run"},
        ["rr"] = {name = "Rust run"},
        ["rl"] = {name = "Rust runnables"},
        ["rd"] = {name = "Rust debuggables"},
        ["rw"] = {name = "Cargo watch"}
    }
    local imappings = {r = {name = "Run", ["w"] = {name = "Cargo watch"}}}

    wk.register(mappings, opts)
    wk.register(imappings, iopts)

end

return M
