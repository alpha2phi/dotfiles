local M = {}

function M.setup()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            my_workspace = "~/workspace/dev/notes",
          },
        },
      },
    },
  }
end

return M
