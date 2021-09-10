local M = {}

local opts = {auto_save_enabled = nil, auto_restore_enabled = nil}

function M.setup() require('auto-session').setup(opts) end

return M
