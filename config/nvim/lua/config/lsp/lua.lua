local M = {}

local lsputils = require("config.lsp.utils")

DATA_PATH = vim.fn.stdpath("data")

CONFIG = {

    library = {vimruntime = true, types = true, plugins = true},
    lspconfig = {
        capabilities = lsputils.get_capabilities(),
        on_attach = lsputils.lsp_attach,
        on_init = lsputils.lsp_init,
        on_exit = lsputils.lsp_exit,
        cmd = {
            DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server", "-E",
            DATA_PATH .. "/lspinstall/lua/sumneko-lua/extension/server/main.lua"
        },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";")
                },
                diagnostics = {globals = {"vim"}},
                workspace = {
                    library = {
                        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true
                    },
                    maxPreload = 100000,
                    preloadFileSize = 1000
                }
            }
        }
    }
}

function M.setup()
    local luadev = require("lua-dev").setup(CONFIG)
    local lspconfig = require("lspconfig")
    lspconfig.sumneko_lua.setup(luadev)
end

return M
