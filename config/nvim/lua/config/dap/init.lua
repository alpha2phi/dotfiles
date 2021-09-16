local M = {}

function M.setup()
  -- DAPInstall
  local dap_install = require "dap-install"
  dap_install.setup {
    installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
  }

  -- telescope-dap
  require("telescope").load_extension "dap"

  -- nvim-dap-virtual-text. Show virtual text for current frame
  vim.g.dap_virtual_text = true

  -- nvim-dap-ui
  require("dapui").setup {}

  -- languages
  require("config.dap.python").setup()
  require("config.dap.rust").setup()
  require("config.dap.go").setup()
  require("config.dap.node").setup()
  require("config.dap.lua").setup()

  -- nvim-dap
  vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

  -- key mappings
  local wk = require "config.which-key"
  wk.register_dap()
end

return M
