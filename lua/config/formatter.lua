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
		typescriptreact = { prettier },
		typescript = { prettier },
		javascript = { prettier },
		javascriptreact = { prettier },
		lua = { stylua },
	},
})

vim.api.nvim_exec(
	[[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.lua FormatWrite
    augroup END
]],
	true
)
