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
]]):format([[call setloclist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))

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
		magic_window = true,
		auto_resize_height = true,
		preview = {
			auto_preview = true,
			win_height = 30,
			win_vheight = 21,
			delay_syntax = 80,
			border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
			wrap = true,
			should_preview_cb = function(bufnr)
				local ret = true
				local filename = vim.api.nvim_buf_get_name(bufnr)
				local fsize = vim.fn.getfsize(filename)
				-- file size greater than 100k can't be previewed automatically
				if fsize > 100 * 1024 then
					ret = false
				elseif filename:match("^fugitive://") then
					-- skip fugitive buffer
					ret = false
				end
				return ret
			end,
		},
		-- make `drop` and `tab drop` to become preferred
		func_map = {
			open = "<CR>",
			openc = "o",
			drop = "O",
			split = "<C-x>",
			vsplit = "<C-v>",
			tab = "t<CR>",
			tabc = "to",
			tabb = "<C-t>",
			tabdrop = "tO",
			prevfile = "k",
			nextfile = "j",
			prevhist = "<",
			nexthist = ">",
			lastleave = "gi",
			stoggleup = "<S-TAB>",
			stoggledown = "<TAB>",
			stogglevm = "<TAB>",
			stogglebuf = "'<TAB>",
			sclear = "z<TAB>",
			pscrollup = "<C-u>",
			pscrolldown = "<C-d>",
			pscrollorig = "gg",
			ptogglemode = "<space><CR>",
			ptoggleitem = "p",
			ptoggleauto = "P",
			filter = "zn",
			filterr = "zN",
			fzffilter = "f",
		},
		filter = {
			fzf = {
				action_for = {
					["ctrl-t"] = "tabdrop",
					["ctrl-v"] = "vsplit",
					["ctrl-x"] = "split",
					["ctrl-q"] = "signtoggle",
					["ctrl-c"] = "closeall",
				},
				extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
			},
		},
	})
end

return config
