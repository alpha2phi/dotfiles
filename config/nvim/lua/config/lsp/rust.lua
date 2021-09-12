local M = {}

local lsputils = require("config.lsp.utils")

DATA_PATH = vim.fn.stdpath("data")

CONFIG = {
    --         assist = {
    --             importGranularity = "module",
    --             importEnforceGranularity = true
    --         },
    --         cargo = {loadOutDirsFromCheck = true, allFeatures = true},
    --         procMacro = {enable = true},
    --         checkOnSave = {command = "clippy"},
    --         experimental = {procAttrMacros = true},
    --         hoverActions = {references = true},
    --         inlayHints = {
    --             chainingHints = true,
    --             maxLength = 40,
    --             parameterHints = true,
    --             typeHints = true
    --         },
    -- lens = {methodReferences = true, references = true}
}

-- local tools = {
--     autoSetHints = true,
--     runnables = {use_telescope = true},
--     inlay_hints = {show_parameter_hints = true},
--     hover_actions = {auto_focus = true}
-- }

function M.setup()
    require('rust-tools').setup({
        -- tools = tools,
        server = {
            capabilities = lsputils.get_capabilities(),
            on_attach = lsputils.lsp_attach,
            on_init = lsputils.lsp_init,
            on_exit = lsputils.lsp_exit,
            flags = {debounce_text_changes = 150}
        },
        -- settings = {["rust-analyzer"] = CONFIG}
    })
    require('rust-tools-debug').setup()
end

return M
