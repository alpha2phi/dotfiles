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
  efm = "efm",
  html = "html",
  graphql = "graphql",
  python = "pyright",
  tailwind = "tailwindcss",
  clojure = "clojure_lsp",
}

--Some Diagnostic Icons
vim.fn.sign_define("LspDiagnosticsSignError", { text = "✘", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })
vim.fn.sign_define("DiagnosticSignError", { text = "✘", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })

for server, name in pairs(my_servers) do
  if server == "json"
      or server == "css"
      or server == "cssmodules"
      or server == "lua"
      or server == "python"
      or server == "clojure"
  -- or server == "diagnosticls"
  -- or server == "eslint"
  then
    lspconfig[name].setup(cfg[server]())
  elseif server == "typescript" then
    require("typescript").setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false, -- enable debug logging for commands
      server = cfg[server](),
    })
  elseif server == "efm" then
    cfg[server]()
  else
    lspconfig[name].setup(cfg.generic())
  end
end

vim.cmd([[do User LspAttachBuffers]])
