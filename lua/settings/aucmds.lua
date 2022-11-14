--@diagnostic disable: undefined-global
local M = {
  MyBootAugroup = {
    -- ["VimEnter"] = {
    --   pattern = "*",
    --   callback = my.fn.onAfterBoot,
    -- }
  },
  MyHighlightAugroup = {
    ["TextYankPost"] = {
      pattern = "*",
      callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", hlgroup = "IncSearch", timeout = 500 }
      end,
    },
    -- ["BufEnter"] = {
    --   {
    --     pattern = "*",
    --     callback = my.fn.activate_current_win_sep,
    --   },
    -- },
    -- ["BufLeave"] = {
    --   {
    --     pattern = "*",
    --     callback = my.fn.clear_current_win_sep,
    --   },
    -- }
  },
  MyColorAugroup = {
    ["ModeChanged"] = {
      pattern = "*",
      callback = my.fn.onModeChanged,
    },
    ["ColorScheme"] = {
      pattern = "*",
      callback = my.fn.onColorscheme,
    }
  },
  MyReadAugroup = {
    ["BufNewFile,BufRead"] = {
      {
        pattern = "*.md,*.org,*.wiki,*.dict,*.txt",
        callback = function()
          vim.cmd("setlocal spell")
        end,
      },
      {
        pattern = "*.org,*.wiki",
        callback = function()
          vim.cmd("setfiletype markdown")
        end,
      }
    }
  },
  MyWriteAugroup = {
    ["BufWritePre"] = {
      pattern = "*.clj,*.cljc,*.cljs",
      callback = function()
        -- vim.cmd("CljFmt")
      end
    },
    ["BufWritePost"] = {
      pattern = "plugins.lua",
      callback = function()
        vim.cmd([[source <afile> | PackerCompile]])
      end
    },
  },
  MyTerminalAugroup = {
    ["TermOpen"] = {
      pattern = "*",
      callback = function()
        vim.cmd([[
          setlocal number norelativenumber
          startinsert
        ]])
      end,
    }
  },
  MyCursorAugroup = {
    ["VimEnter,WinEnter,BufWinEnter"] = {
      pattern = "*",
      callback = function()
        vim.cmd("setlocal cursorline cursorcolumn")
      end,
    },
    ["WinLeave"] = {
      pattern = "*",
      callback = function()
        vim.cmd("setlocal nocursorline nocursorcolumn")
      end,
    },
    ["BufEnter,FocusGained,InsertLeave"] = {
      pattern = "*",
      callback = function()
        vim.cmd("set relativenumber")
      end,
    },
    ["BufLeave,FocusLost,InsertEnter"] = {
      pattern = "*",
      callback = function()
        vim.cmd("set norelativenumber")
      end,
    }
  },
  MyFoldsAugroup = {
    ["BufWinEnter,BufWritePost"] = {
      {
        pattern = "*.lua,*.clj,*.cljs,*.ts,*.tsx,*.js,*.jsx,*.json",
        callback = function()
          vim.cmd([[
            edit
            silent! loadview
          ]])
        end,
      },
    },
    ["BufWinLeave,BufWritePre"] = {
      {
        pattern = "*.lua,*.clj,*.cljs,*.ts,*.tsx,*.js,*.jsx,*.json",
        callback = function()
          vim.cmd("mkview")
        end,
      },
    }
  }
}

return M
