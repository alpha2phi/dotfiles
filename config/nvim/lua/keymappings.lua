local utils = require('utils')

utils.map_key('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map_key('i', 'jk', '<Esc>') -- jk to escape
utils.map_key('n', '<Leader>tt', '<Cmd>15sp +term<CR>')
utils.map_key('n', '<Leader>fq', '<Cmd>q<CR>')
utils.map_key('n', '<Leader>fsf', '<Cmd>w<CR>')
utils.map_key('n', '<Leader>w', '<Cmd>update<CR>')
utils.map_key('n', '<Leader>fv', '<Cmd>NvimTreeToggle<CR>')
utils.map_key('n', '<Leader>rr', '!!$SHELL<CR>')
utils.map_key('n', '<C-w><C-o>', ':MaximizerToggle!<CR>')
-- utils.map_key('n', '<Leader>fv', '<Cmd>lefta 20vsp .<CR>')
-- utils.map_key('n', '<Leader>dsv', ':source %<CR>')
-- utils.map_key('n', '<Leader>dsl', ':luafile %<CR>')

utils.map_key('t', '<C-w><C-o>', '<C-\\><C-n> :MaximizerToggle!<CR>')
utils.map_key('t', '<C-h>', '<C-\\><C-n><C-w>h')
utils.map_key('t', '<C-j>', '<C-\\><C-n><C-w>j')
utils.map_key('t', '<C-k>', '<C-\\><C-n><C-w>k')
utils.map_key('t', '<C-l>', '<C-\\><C-n><C-w>l')
utils.map_key('t', 'jk', '<C-\\><C-n>')

-- utils.map_key('n', '<Leader>bd', '<Cmd>bd<CR>')
-- utils.map_key('n', '<Leader>ba', '<Cmd>%bd|e#<CR>')
-- utils.map_key('n', '<Leader>bn', '<Cmd>bn<CR>')
-- utils.map_key('n', '<Leader>bp', '<Cmd>bp<CR>')
-- utils.map_key('n', '<Leader>bq', '<Cmd>q<CR>')
-- utils.map_key('n', '<Leader>bl', '<Cmd>ls<CR>')

utils.map_key('n', '<Leader>qf', '<Cmd>copen<CR>')
utils.map_key('n', '<Leader>qc', '<Cmd>cclose<CR>')
utils.map_key('n', '<Leader>qn', '<Cmd>cnext<CR>')
utils.map_key('n', '<Leader>qp', '<Cmd>cprev<CR>')
utils.map_key('n', '<Leader>qz', '<Cmd>cex []<CR>')
utils.map_key('n', '<Leader>qh', 'q:')
utils.map_key('n', '<Leader>qs', 'q/')

-- Transparent background
utils.map_key('n', '<Leader>xc', '<Cmd>hi Normal ctermbg=none guibg=none<CR>')

-- utils.map_key('n', ';', ':')
-- utils.map_key('v', ';', ':')

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
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi

nnoremap <Leader>es :call tts#Speak()<CR>
vnoremap <Leader>es :call tts#Speak(1)<CR>

nnoremap Y y$

nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'

]], false)
