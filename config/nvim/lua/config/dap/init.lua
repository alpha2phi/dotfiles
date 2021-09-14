local M = {}

function M.setup()
  -- telescope-dap
  require("telescope").load_extension "dap"

  -- d for nvim-dap, v for vimspector
  vim.g.my_debugger = "d"

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
end

return M
