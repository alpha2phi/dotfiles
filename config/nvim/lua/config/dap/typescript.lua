local M = {}

function M.setup()
  local dap = require "dap"
  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { os.getenv "HOME" .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" }, -- TODO adjust
  }

  dap.configurations.javascriptreact = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }

  dap.configurations.typescriptreact = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }
end

return M
