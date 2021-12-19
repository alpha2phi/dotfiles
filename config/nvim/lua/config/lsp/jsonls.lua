local M = {}

local lsputils = require "config.lsp.utils"

function M.setup(installed_server)
  require("lspconfig").jsonls.setup {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    on_attach = M.lsp_attach,
    capabilities = lsputils.get_capabilities(),
    on_init = lsputils.lsp_init,
    on_exit = lsputils.lsp_exit,
    flags = { debounce_text_changes = 150 },
    cmd = installed_server._default_options.cmd,
  }
end

return M
