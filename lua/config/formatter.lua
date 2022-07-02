---@diagnostic disable:undefined-global
local M = {}

local defaults = require("formatter.defaults")
local util = require("formatter.util")

-- vim.api.nvim_exec(
--   [[
-- 		augroup FormatAutogroup
-- 				autocmd!
-- 				autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.lua mkview
-- 				autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.lua FormatWrite | loadview
-- 		augroup END
-- ]] ,
--   true
-- )

function M.setup()
  -- local eslint = function()
  -- 	return {
  -- 		exe = "./node_modules/.bin/eslint",
  -- 		args = {
  -- 			"--stdin-filename",
  -- 			vim.api.nvim_buf_get_name(0),
  -- 			"--fix",
  -- 			"--cache",
  -- 		},
  -- 		stdin = false,
  -- 	}
  -- end

  -- local prettier = function()
  -- 	return {
  -- 		exe = "prettier",
  -- 		args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()) },
  -- 		stdin = true,
  -- 	}
  -- end

  local stylua = function()
    return {
      exe = "stylua",
      args = {
        vim.api.nvim_buf_get_name(0),
      },
      stdin = false,
    }
  end
  local ts = require("formatter.filetypes.typescript")
  local tsx = require("formatter.filetypes.typescriptreact")

  require("formatter").setup({
    filetype = {
      javascript = require("formatter.filetypes.javascript"),
      javascriptreact = require("formatter.filetypes.javascriptreact"),
      typescript = ts,
      typescriptreact = { tsx.prettierd, tsx.prettiereslint, tsx.eslint_d, tsx.prettier },
      lua = { stylua },
    },
  })
end

return M
