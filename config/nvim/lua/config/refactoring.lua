local M = {}

function M.setup()
  local refactor = require "refactoring"
  refactor.setup {}

  require("telescope").load_extension "refactoring"
end

return M
