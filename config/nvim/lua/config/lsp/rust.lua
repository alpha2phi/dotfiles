local M = {}

local lsputils = require("config.lsp.utils")

CONFIG = {
}

function M.setup()
    require('rust-tools').setup({
        server = {
            capabilities = lsputils.get_capabilities(),
            on_attach = lsputils.lsp_attach,
            on_init = lsputils.lsp_init,
            on_exit = lsputils.lsp_exit,
            flags = {debounce_text_changes = 150}
        },
    })
end

return M
