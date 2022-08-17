---@diagnostic disable:undefined-global
local M = {}

function M.setup()
  local opts = {
    log_level = "error",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = false,
    auto_session_use_git_branch = true,
    pre_save_cmds = {},
    post_save_cmds = {},
    pre_restore_cmds = {},
    post_restore_cmds = {},
  }

  vim.defer_fn(function()
    require("auto-session").setup(opts)
  end, 1000)
end

return M
