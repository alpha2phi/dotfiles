local M = {}

function M.setup()
  local dap = require "dap"

  dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = {
      vim.fn.stdpath "data" .. "/dapinstall/jsnode_dbg/" .. "/vscode-node-debug2/out/src/nodeDebug.js",
    },
  }

  dap.configurations.javascript = {
    {
      type = "node2",
      request = "launch",
      program = "${workspaceFolder}/${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
  }
end

return M
