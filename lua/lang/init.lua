---@diagnostic disable: undefined-global
require("nvim-lsp-installer").setup({ automatic_installation = true })
local lspconfig = require("lspconfig")
local cfg = require("lang/setup")

local my_servers = {
  typescript = "tsserver",
  json = "jsonls",
  css = "cssls",
  cssmodules = "cssmodules_ls",
  lua = "sumneko_lua",
  diagnostic = "efm",
  html = "html",
  graphql = "graphql",
}

--Some Diagnostic Icons
vim.fn.sign_define("LspDiagnosticsSignError", { text = "✘", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })

for i, server in pairs(my_servers) do
  if server == "jsonls"
      or server == "cssls"
      or server == "cssmodules_ls"
      or server == "sumneko_lua"
  -- or server == "diagnosticls"
  -- or server == "eslint"
  then
    lspconfig[server].setup(cfg[server]())
  elseif server == "tsserver" then
    require("typescript").setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false, -- enable debug logging for commands
      server = cfg[server](),
    })
  elseif server == "efm" then
    cfg[server]()
  else
    lspconfig[server].setup(cfg.generic())
  end
end

vim.cmd([[do User LspAttachBuffers]])
