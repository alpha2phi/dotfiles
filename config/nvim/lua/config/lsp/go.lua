local M = {}

local lsputils = require("config.lsp.utils")

CONFIG = {
    -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
    experimentalPostfixCompletions = true,
    analyses = {unusedparams = true, unreachable = false},
    codelenses = {generate = true, gc_details = true, test = true, tidy = true},
    usePlaceholders = true,
    completeUnimported = true,
    staticcheck = true,
    matcher = "fuzzy",
    experimentalDiagnosticsDelay = "500ms",
    symbolMatcher = "fuzzy",
    gofumpt = true,
    buildFlags = {"-tags", "integration"}
}

function M.setup()
    lsputils.setup_server("go", CONFIG)
end

return M
