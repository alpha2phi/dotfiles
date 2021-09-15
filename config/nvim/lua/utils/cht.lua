-- input = vim.fn.input("cheatsheet input: ", "sss", "file")
-- print(input)

local buf = vim.api.nvim_create_buf(true, true)
vim.api.nvim_buf_set_name(buf, "cht")
-- local opts = {'relative'= 'cursor', 'width': 10, 'height': 2, 'col': 0,  'row': 1, 'anchor': 'NW', 'style': 'minimal'}
-- local opts = { relative = "cursor", width = 100, height = 100 }
vim.api.nvim_open_win(buf, true)
