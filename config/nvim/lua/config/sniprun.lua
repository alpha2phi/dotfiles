local M = {}

function M.setup()
  require("sniprun").setup {
    display = {
      "Classic",
      "VirtualTextOk",
      "TempFloatingWindow",
    },
  }
end

return M
