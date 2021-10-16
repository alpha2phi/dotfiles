local M = {}

local lsputils = require "config.lsp.utils"

CONFIG = {}

function M.setup()
  local nls = require "null-ls"
  local sources = {
    nls.builtins.formatting.prettierd,
    nls.builtins.formatting.eslint_d,
    nls.builtins.diagnostics.shellcheck,
    nls.builtins.diagnostics.markdownlint,
    -- nls.builtins.code_actions.gitsigns,
    nls.builtins.formatting.prettier,
    nls.builtins.formatting.stylua,
    nls.builtins.formatting.black,
    nls.builtins.diagnostics.flake8,
  }
  nls.config { sources = sources }

  lsputils.setup_server("null-ls", CONFIG)
end

return M
