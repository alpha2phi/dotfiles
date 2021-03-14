lua << EOF

local saga = require 'lspsaga'
saga.init_lsp_saga()

EOF

nnoremap <leader>cf :Lspsaga lsp_finder<CR>
