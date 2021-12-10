local M = {}

function M.setup()
  require("bufferline").setup {
    options = {
      numbers = "both",
      diagnostics = "nvim_diagnostic",
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  }
end

return M
