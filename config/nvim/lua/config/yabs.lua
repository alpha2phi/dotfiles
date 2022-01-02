local M = {}

function M.setup()
  require("yabs"):setup {
    languages = {

      -- Lua
      lua = {
        tasks = {
          run = {
            command = "luafile %",
            type = "lua",
          },
        },
      },

      -- Python
      python = {
        tasks = {
          run = {
            command = "python %",
            output = "echo",
          },
          monitor = {
            command = "nodemon -e py %",
            output = "terminal",
          },
        },
      },

      -- Others
    },
  }
  require("telescope").load_extension "yabs"
end

return M
