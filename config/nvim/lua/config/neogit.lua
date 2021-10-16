local M = {}

function M.setup()
  require("neogit").setup { integrations = { diffview = true } }
end

return M
