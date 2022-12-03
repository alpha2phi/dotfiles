local M = {}

function M.setup()
  require("zen-mode").setup({
    window = {
      backdrop = 0.5, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      -- height and width can be:
      -- * an absolute number of cells when > 1
      -- * a percentage of the width / height of the editor when <= 1
      -- * a function that returns the width or the height
      width = 130, -- width of the Zen window
      height = 0.98, --vim.api.nvim_win_get_height(0),
      -- by default, no options are changed for the Zen window
      -- uncomment any of the options below, or add other vim.wo options you want to apply
      options = {
        signcolumn = "auto:3", -- disable signcolumn
        number = true, -- disable number column
        relativenumber = true, -- disable relative numbers
        cursorline = true, -- disable cursorline
        cursorcolumn = true, -- disable cursor column
        foldcolumn = "1", -- disable fold column
        list = true, -- disable whitespace characters
      },
    },
    plugins = {
      -- disable some global vim options (vim.o...)
      -- comment the lines to not apply the options
      options = {
        enabled = false,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
      },
      twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = false }, -- disables git signs
      tmux = { enabled = true }, -- disables the tmux statusline
      -- this will change the font size on kitty when in zen mode
      -- to make this work, you need to set the following kitty options:
      -- - allow_remote_control socket-only
      -- - listen_on unix:/tmp/kitty
      kitty = {
        enabled = true,
        font = "+2", -- font size increment
      },
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function(win)
      -- vim.api.nvim_win_set_height(0, vim.api.nvim_win_get_height(0) - 2)
      -- vim.api.nvim_win_set_config(win, { relative = 'win', bufpos = { 0, -1 } })
      vim.defer_fn(function()
        vim.cmd("e")
        vim.wo.foldmethod = "expr"
        vim.go.cmdheight = 0
        -- vim.api.nvim_win_set_config(win, { relative = 'win', bufpos = { 0, -1 } })
      end, 100)
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
      vim.defer_fn(function()
        vim.go.cmdheight = 1
      end, 0)
    end,
  })
end

return M
