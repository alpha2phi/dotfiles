local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('n', '<Leader>tt','<Cmd>15sp +term<CR>a')
utils.map('n', '<Leader>fq','<Cmd>q<CR>')
utils.map('n', '<Leader>fsf','<Cmd>w<CR>')
