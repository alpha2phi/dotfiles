local M = {}

local lsp_providers = {
  rust_analyzer = true,
  tsserver = true,
  pyright = true,
  gopls = true,
  sumneko_lua = true,
  jsonls = true,
}

local function setup_servers()
  local lsp_installer = require "nvim-lsp-installer"

  require("config.lsp.null-ls").setup()

  lsp_installer.on_server_ready(function(server)
    if lsp_providers[server.name] then
      require("config.lsp." .. server.name).setup(server)
    else
      local opts = {}
      server:setup(opts)
    end
  end)
end

function M.setup()
  setup_servers()
end

return M
