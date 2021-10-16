local M = {}

local lsp_providers = { lua = true, rust = true, go = true, python = true, typescript = true }

local function setup_servers()
  -- local lspinstall = require "lspinstall"

  local lsp_installer = require "nvim-lsp-installer"
  local lsp_utils = require "config.lsp.utils"

  -- lspinstall.setup()

  -- null-ls
  require("config.lsp.null-ls").setup()

  lsp_installer.on_server_ready(function(server)
    local opts = {}
    print(vim.inspect.inspect(server))

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)

  -- local servers = lspinstall.installed_servers()
  -- for _, server in pairs(servers) do
  --   if lsp_providers[server] then
  --     require("config.lsp." .. server).setup()
  --   else
  --     lsputils.setup_server(server)
  --   end
  -- end
end

-- local function post_install()
--   local lspinstall = require "lspinstall"
--   lspinstall.post_install_hook = function()
--     setup_servers()
--     vim.cmd "bufdo e"
--   end
-- end

function M.setup()
  -- post_install()
  setup_servers()
end

return M
