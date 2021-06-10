local utils = require('utils')

utils.map('n', '<Esc><Esc>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>') -- jk to escape
-- utils.map('n', '<Leader>tt', '<Cmd>15sp +term<CR>')
utils.map('n', '<Leader>fq', '<Cmd>q<CR>')
utils.map('n', '<Leader>fsf', '<Cmd>w<CR>')
utils.map('n', '<Leader>fv', '<Cmd>15Vex<CR>')
-- utils.map('n', '<Leader>rr', '!!$SHELL<CR>')
-- utils.map('n', '<C-w><C-o>', ':MaximizerToggle!<CR>')
utils.map('n', '<Leader>%i', ':source ~/.config/nvim/init.vim<CR>')
utils.map('n', '<Leader>%v', ':source %<CR>')
utils.map('n', '<Leader>%l', ':luafile %<CR>')

-- utils.map('t', '<C-w><C-o>', '<C-\\><C-n> :MaximizerToggle!<CR>')
-- utils.map('t', '<C-h>', '<C-\\><C-n><C-w>h')
-- utils.map('t', '<C-j>', '<C-\\><C-n><C-w>j')
-- utils.map('t', '<C-k>', '<C-\\><C-n><C-w>k')
-- utils.map('t', '<C-l>', '<C-\\><C-n><C-w>l')
-- utils.map('t', 'jk', '<C-\\><C-n>')

-- utils.map('n', '<Leader>bd', '<Cmd>bd<CR>')
-- utils.map('n', '<Leader>ba', '<Cmd>%bd|e#<CR>')
-- utils.map('n', '<Leader>bn', '<Cmd>bn<CR>')
-- utils.map('n', '<Leader>bp', '<Cmd>bp<CR>')
-- utils.map('n', '<Leader>bq', '<Cmd>q<CR>')
-- utils.map('n', '<Leader>bl', '<Cmd>ls<CR>')

-- utils.map('n', '<Leader>qf', '<Cmd>copen<CR>')
-- utils.map('n', '<Leader>qc', '<Cmd>cclose<CR>')
-- utils.map('n', '<Leader>qn', '<Cmd>cnext<CR>')
-- utils.map('n', '<Leader>qp', '<Cmd>cprev<CR>')

vim.api.nvim_exec([[

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

vmap < <gv
vmap > >gv

nnoremap <silent> <M-left> <C-w>>
nnoremap <silent> <M-right> <C-w><
nnoremap <silent> <M-up> <C-w>+
nnoremap <silent> <M-down> <C-w>-

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

nnoremap <Leader>pd :let &runtimepath.=','.escape(expand('%:p:h'), '\,')

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

]], false)
