local M = {}

local lsputils = require "config.lsp.utils"

CONFIG = {}

function M.setup()
  local null_ls = require "null-ls"
  local sources = {
    -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.diagnostics.write_good.with { filetypes = { "markdown", "text" } },
    -- null_ls.builtins.formatting.isort,
    -- null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.flake8,
  }
  null_ls.config { sources = sources }

  lsputils.setup_server("null-ls", CONFIG)
end

return M
