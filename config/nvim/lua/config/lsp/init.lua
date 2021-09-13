local M = {}

local lsp_providers = {lua = true, rust = true, go = true, python = true}

local function setup_servers()

    local lspinstall = require("lspinstall")
    local lsputils = require("config.lsp.utils")

    lspinstall.setup()

    local servers = lspinstall.installed_servers()
    for _, server in pairs(servers) do
        if lsp_providers[server] then
            require("config.lsp." .. server).setup()
        else
            lsputils.setup_server(server)
        end
    end

end

local function post_install()
    local lspinstall = require("lspinstall")
    lspinstall.post_install_hook = function()
        setup_servers()
        vim.cmd("bufdo e")
    end
end

function M.setup()
    post_install()
    setup_servers()
end

return M
