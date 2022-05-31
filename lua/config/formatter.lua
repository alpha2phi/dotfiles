---@diagnostic disable:undefined-global
local M = {}

local defaults = require("formatter.defaults")
local util = require("formatter.util")

vim.api.nvim_exec(
	[[
		augroup FormatAutogroup
				autocmd!
				autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.lua mkview | FormatWrite | loadview
		augroup END
]],
	true
)

function M.setup()
	local esformatter = util.copyf(defaults.esformatter)
	local prettiereslint = util.copyf(defaults.prettiereslint)

	local eslint = function()
		return {
			exe = "./node_modules/.bin/eslint",
			args = {
				"--stdin-filename",
				vim.api.nvim_buf_get_name(0),
				"--fix",
				"--cache",
			},
			stdin = false,
		}
	end

	local prettier = function()
		return {
			exe = "prettier",
			args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
			stdin = true,
		}
	end

	local stylua = function()
		return {
			exe = "stylua",
			args = {
				vim.api.nvim_buf_get_name(0),
			},
			stdin = false,
		}
	end

	require("formatter").setup({
		filetype = {
			typescriptreact = { prettiereslint, prettier, esformatter },
			typescript = { prettiereslint, prettier, esformatter },
			javascript = { prettiereslint, prettier, esformatter },
			javascriptreact = { prettiereslint, prettier, esformatter },
			lua = { stylua },
		},
	})
end

return M
