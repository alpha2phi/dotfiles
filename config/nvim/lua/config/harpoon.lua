local M = {}

function M.setup()
  require("harpoon").setup {}
  require("telescope").load_extension "harpoon"
end

return M
