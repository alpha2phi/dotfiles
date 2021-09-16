local M = {}

function M.cheatsheet()
  local input = vim.fn.input("cheatsheet input: ", "", "file")
  local command = ""

  if input == "" then
    return
  elseif input == "h" then
    command = ""
  else
    local lang = ""
    local search = ""
    local delimiter = " "
    local count = 0
    for w in (input .. delimiter):gmatch("(.-)" .. delimiter) do
      if count == 0 then
        lang = w
        count = count + 1
      else
        search = search .. "+" .. w
      end
    end
    command = lang
    if search ~= "" then
      command = command .. "/" .. search
    end
  end
  M.cheatsheet_cmd(command)
end

function M.cheatsheet_cmd(command)
  vim.api.nvim_exec("enew", true)
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_name(buf, "cheatsheet-" .. buf)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "swapfile", false)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_exec("terminal", true)
  local chan_id = vim.b.terminal_job_id

  local cheatsheetcmd = "curl cht.sh/" .. command
  vim.api.nvim_chan_send(chan_id, cheatsheetcmd .. "\n")
end

return M
