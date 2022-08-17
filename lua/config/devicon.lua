local M = {}

function M.setup()
  require("nvim-web-devicons").setup({
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
  })
end

return M
