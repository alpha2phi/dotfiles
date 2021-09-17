local M = {}

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
    for w in (input .. delimiter):gmatch("(.-)" .. delimiter) do
      if lang == "" then
        lang = w
      else
        if search == "" then
          search = w
        else
          search = search .. "+" .. w
        end
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
  vim.api.nvim_exec("terminal", true)
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_name(buf, "cheatsheet-" .. buf)

  local chan_id = vim.b.terminal_job_id
  local cht_cmd = "curl cht.sh/" .. cmd
  vim.api.nvim_chan_send(chan_id, cht_cmd .. "\n")
  vim.cmd [[stopinsert]]
end

return M
