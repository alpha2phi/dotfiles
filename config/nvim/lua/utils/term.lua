local M = {}

function M.send_cmds(cmds)
  for idx, val in ipairs(vim.fn.tabpagebuflist()) do
    print("sending " .. cmds)
  end
end

M.send_cmds "testing"

-- https://www.reddit.com/r/neovim/comments/753ztk/how_to_run_current_line_in_terminal_inside_neovim/

return M
