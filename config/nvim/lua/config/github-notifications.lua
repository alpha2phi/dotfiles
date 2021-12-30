local M = {}

function M.setup()
  require("github-notifications").setup {
    username = "<username>",
    token = "<token>",
  }
  require("telescope").load_extension "ghn"
end

return M
