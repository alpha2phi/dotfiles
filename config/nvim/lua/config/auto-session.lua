local M = {}

local opts = {auto_save_enabled = false, auto_restore_enabled = false, auto_session_enable_last_session = false}

function M.setup() require('auto-session').setup(opts) end

return M
