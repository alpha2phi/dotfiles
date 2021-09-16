local M = {}

-- input = vim.fn.input("cheatsheet input: ", "sss", "file")
-- print(input)

function M.createFloatingWindow()
  local stats = vim.api.nvim_list_uis()[1]
  local width = stats.width
  local height = stats.height
  local buf = vim.api.nvim_create_buf(false, true)
  return vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width - 8,
    height = height - 8,
    col = 2,
    row = 2,
    border = "double",
  })
end

function M.createTab()
  -- vim.api.nvim_exec("tabnew | term", true)
  -- local win = vim.api.nvim_get_current_win()
  -- local buf = vim.api.nvim_get_current_buf()
  -- vim.api.nvim_buf_set_name(buf, "cht-" .. buf)
  -- vim.api.nvim_buf_set_option(buf, "buftype", "terminal")
  -- local function print_stdout(chan_id, data, name)
  --   print "sending command"
  --   vim.api.nvim_chan_send(chan_id, "echom 123\n")
  -- end
  -- vim.fn.jobstart("clear\n", { on_stdout = print_stdout })
  -- return win

  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(buf, "cht-" .. buf)
  local chan_id = vim.api.nvim_open_term(buf, {})
  local data = "echo 123" -- Swap `\n` with `\r\n` to see difference
  vim.api.nvim_chan_send(chan_id, data)
end

M.createTab()
