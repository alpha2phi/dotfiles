local M = {}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.cheatsheet()
  local input = vim.fn.input("cheatsheet input: ", "", "file")
  local cmd = ""

  if input == "" then
    return
  elseif input == "h" then
    cmd = ""
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
    cmd = lang
    if search ~= "" then
      cmd = cmd .. "/" .. search
    end
  end
  M.cheatsheet_cmd(cmd)
end

function M.cheatsheet_cmd(cmd)
  vim.api.nvim_exec("enew", true)
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_name(buf, "cheatsheet-" .. buf)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "swapfile", false)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_exec("terminal", true)
  local chan_id = vim.b.terminal_job_id

  local cht_cmd = "curl cht.sh/" .. cmd
  vim.api.nvim_chan_send(chan_id, cht_cmd .. "\n")
  vim.cmd [[stopinsert]]
end

return M
