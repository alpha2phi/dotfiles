local M = {}

function M.send(cmds)
  local term_buf_id = -1
  for _, buf_id in ipairs(vim.fn.tabpagebuflist()) do
    local buf_type = vim.api.nvim_buf_get_option(buf_id, "buftype")
    if buf_type == "terminal" then
      print(buf_type)
      local chan_id = vim.api.nvim_buf_get_var(buf_id, "terminal_job_id")
      print(chan_id)

      vim.api.nvim_buf_get_commands
      -- local cht_cmd = "curl cht.sh/" .. cmd
      -- vim.api.nvim_chan_send(chan_id, cht_cmd .. "\n")
      -- vim.cmd [[stopinsert]]
    end
  end
end

M.send "testing"

-- https://www.reddit.com/r/neovim/comments/753ztk/how_to_run_current_line_in_terminal_inside_neovim/

return M
