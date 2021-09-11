local M = {}

local opts = {auto_save_enabled = false, auto_restore_enabled = false}

function M.setup() require('auto-session').setup(opts) end

return M
