local M = {}

local lsputils = require "config.lsp.utils"

function M.setup(installed_server)
  local opts = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    on_attach = lsputils.lsp_attach,
    capabilities = lsputils.get_capabilities(),
    on_init = lsputils.lsp_init,
    on_exit = lsputils.lsp_exit,
    flags = { debounce_text_changes = 150 },
  }
  return opts
end

return M
