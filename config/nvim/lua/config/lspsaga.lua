local M = {}

function M.setup()
    local saga = require('lspsaga')
    saga.init_lsp_saga()
end

return M
