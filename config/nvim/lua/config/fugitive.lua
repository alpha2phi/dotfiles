local utils = require('utils')


utils.map('n', '<Leader>gs', '<cmd>Gstatus<CR>')
utils.map('n', '<Leader>gb', '<cmd>GBranches<CR>')
utils.map('n', '<Leader>gf', '<cmd>Fit fetch --all<CR>')
utils.map('n', '<Leader>grum', '<cmd>Git rebase upstream/master<CR>')  
utils.map('n', '<Leader>grom', '<cmd>Git rebase origin/master<CR>') 
utils.map('n', '<Leader>gdr', '<cmd>diffget //3<CR>') 
utils.map('n', '<Leader>gdl', '<cmd>diffget //2<CR>') 
