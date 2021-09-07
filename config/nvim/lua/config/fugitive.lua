local utils = require('utils')

utils.map_key('n', '<Leader>gs', '<cmd>Git<CR>')
utils.map_key('n', '<Leader>gp', '<cmd>Git push<CR>')
utils.map_key('n', '<Leader>gb', '<cmd>GBranches<CR>')
utils.map_key('n', '<Leader>gd', '<cmd>Gvdiffsplit<CR>')
utils.map_key('n', '<Leader>gf', '<cmd>Fit fetch --all<CR>')
utils.map_key('n', '<Leader>grum', '<cmd>Git rebase upstream/master<CR>')
utils.map_key('n', '<Leader>grom', '<cmd>Git rebase origin/master<CR>')
utils.map_key('n', '<Leader>gdr', '<cmd>diffget //3<CR>')
utils.map_key('n', '<Leader>gdl', '<cmd>diffget //2<CR>')
utils.map_key('n', '<leader>gdb',
              '<cmd>lua require("config.telescope").git_branches()<CR>')
