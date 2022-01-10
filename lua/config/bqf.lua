---@diagnostic disable: undefined-global

local config = {}

-- https://github.com/mhinz/vim-grepper
vim.g.grepper = { tools = { "rg", "grep" }, searchreg = 1 }

vim.cmd([[
    packadd nvim-bqf
    packadd fzf
    packadd nvim-treesitter
    packadd vim-grepper
]])

vim.cmd(([[
    aug Grepper
        au!
        au User Grepper ++nested %s
    aug END
]]):format([[call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))

-- try `gsiw` under word
vim.cmd([[
    nmap gs  <plug>(GrepperOperator)
    xmap gs  <plug>(GrepperOperator)
]])

vim.cmd([[
    hi BqfPreviewBorder guifg=#50a14f ctermfg=71
    hi link BqfPreviewRange Search
]])

function config.setup()
	require("bqf").setup({
		auto_enable = true,
		preview = {
			win_height = 12,
			win_vheight = 12,
			delay_syntax = 80,
			border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
			should_preview_cb = function(bufnr)
				local ret = true
				local filename = vim.api.nvim_buf_get_name(bufnr)
				local fsize = vim.fn.getfsize(filename)
				-- file size greater than 100k can't be previewed automatically
				if fsize > 100 * 1024 then
					ret = false
				elseif bufname:match("^fugitive://") then
					-- skip fugitive buffer
					ret = false
				end
				return ret
			end,
		},
		-- make `drop` and `tab drop` to become preferred
		func_map = {
			drop = "o",
			openc = "O",
			split = "<C-s>",
			tabdrop = "<C-t>",
			tabc = "",
			ptogglemode = "z,",
		},
		filter = {
			fzf = {
				action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
				extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
			},
		},
	})
end

return config
