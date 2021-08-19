local utils = require('utils')
local nest = require('nest')

utils.map('n', '<Esc><Esc>', '<cmd>nohl<CR>') -- Clear highlights
utils.map('n', '<Leader>%i', ':luafile ~/.config/nvim/init.lua<CR>')
utils.map('n', '<Leader>%v', ':source %<CR>')
utils.map('n', '<Leader>%l', ':luafile %<CR>')

utils.map('i', 'jk', '<Esc>')
utils.map('i', '<Esc>>>', '<Esc>:w<CR>i')
utils.map('i', '<Esc>>>>', '<Esc>:w!<CR>i')

vim.api.nvim_exec([[

vmap <lt> <gv
vmap <gt> >gv

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

]], false)

nest.applyKeymaps {
    { ';', '<Cmd>Telescope git_files<CR>' },
    { '<M-left>', '<C-w>7<' },
    { '<M-right>', '<C-w>7>' },
    { '<M-up>', '<C-w>7+' },
    { '<M-down>', '<C-w>7-' },
    { '[', {
        { 'b', '<Cmd>BufferLineCyclePrev<CR>' },
        { 'm', '<Cmd>BookmarkPrevious<CR>' },
        { 't', '<Cmd>FloatermPrev<CR>' },
        { 'w', '<Cmd>tabprevious<CR>' },
        { '<leader>', '<C-o>' },
    }},
    { ']', {
        { 'b', '<Cmd>BufferLineCycleNext<CR>' },
        { 'm', '<Cmd>BookmarkNext<CR>' },
        { 't', '<Cmd>FloatermNext<CR>' },
        { 'w', '<Cmd>tabnext<CR>' },
        { '<leader>', '<C-i>' },
    }},
    { '<leader>', {
        { '<esc>', '<Cmd>set relativenumber!<CR>' },
        { '<left>', '<Cmd>call WinMove("h")<CR>' },
        { '<right>', '<Cmd>call WinMove("l")<CR>' },
        { '<up>', '<Cmd>call WinMove("k")<CR>' },
        { '<down>', '<Cmd>call WinMove("j")<CR>' },
        { '<', {
            { 's', '<Cmd>RestoreSession<CR>' },
            { 'm', '<Cmd>LoadBookmarks<CR>' },
        }},
        { '>', {
            { 's', '<Cmd>SaveSession<CR>' },
            { 'm', '<Cmd>SaveBookmarks<CR>' },
        }},
        { 'b', {
            { 'q', ':bp|bd #<CR>' },
        }},
        { 'w', {
            { 'n', '<Cmd>tabnew<CR>' },
            { 'q', '<Cmd>tabclose<CR>' },
        }},
        { 'f', {
            { '?', '<Cmd>Telescope Cheatsheet<CR>' },
            { '/', '<Cmd>TodoTelescope<CR>' },
            { 'b', '<Cmd>Telescope buffers<CR>' },
            { 'c', '<Cmd>Telescope colorscheme<CR>' },
            { 'e', '<Cmd>Telescope file_browser<CR>' },
            { 'f', '<Cmd>Telescope find_files<CR>' },
            { 'g', '<Cmd>Telescope live_grep<CR>' },
            { 'k', '<Cmd>Telescope help_tags<CR>' },
            { 'm*', '<Cmd>Telescope vim_bookmarks all<CR>' },
            { 'm.', '<Cmd>Telescope vim_bookmarks current_file<CR>' },
            { 'n', '<Cmd>Telescope node_modules list' },
            { 'o', '<Cmd>Telescope treesitter<CR>' },
            { 'p', '<Cmd>Telescope projects<CR>' },
            { 's', '<Cmd>Telescope ultisnips ultisnips<CR>' },
            { 'y', '<Cmd>Telescope neoclip<CR>' },
            { 'z', '<Cmd>Telescope current_buffer_fuzzy_find<CR>' },
            { '<leader>', {
                { 'l', {
                    { '$.', '<Cmd>Telescope lsp_document_symbols<CR>' },
                    { '$*', '<Cmd>Telescope lsp_workspace_symbols<CR>' },
                    { 'd.', '<Cmd>Telescope lsp_document_diagnostics<CR>' },
                    { 'd*', '<Cmd>Telescope lsp_workspace_diagnostics<CR>' },
                    { 'gr', '<Cmd>Telescope lsp_references<CR>' },
                    { 'gi', '<Cmd>Telescope lsp_implementations<CR>' },
                    { 'ga', '<Cmd>Telescope lsp_code_actions<CR>' },
                    { 'gd', '<Cmd>Telescope lsp_definitions<CR>' },
                }},
                { 'g', {
                    { 'c.', '<Cmd>Telescope git_bcommits<CR>' },
                    { 'c*', '<Cmd>Telescope git_commits<CR>' },
                    { 'b', '<Cmd>Telescope git_branches<CR>' },
                    { '?', '<Cmd>Telescope git_status<CR>' },
                    { 's', '<Cmd>Telescope git_stash<CR>' },
                    { '@', {
                        { 'i', '<Cmd>Telescope gh issues<CR>' },
                        { 'p', '<Cmd>Telescope gh pull_requests<CR>' },
                    }},
                }},
            }},
        }},
        { 'k', {
            { '*', '<Cmd>call Dasht(dasht#cursor_search_terms(), \'!\')<CR>' },
            { '.', '<Cmd>call Dasht(dasht#cursor_search_terms())<CR>' },
        }},
        { 't', {
            { 'b', {
                { 'm', '<Cmd>BResizeZoom<CR>' },
            }},
            { 'c', '<Cmd>call ToggleBackgroundLightness()<CR>' },
            { 'C', '<Cmd>TSContextToggle<CR>' },
            { 'd', '<Cmd>TroubleToggle<CR>' },
            { 'm', '<Cmd>BookmarkToggle<CR>' },
            { 'q', {
                { 'f', '<Cmd>call ToggleQuickFix()<CR>' },
                { 'l', '<Cmd>call ToggleQuickLoc()<CR>' },
            }},
            { 't', '<Cmd>FloatermToggle<CR>' },
            { '<leader>', {
                { 'd', {
                    { '*', '<Cmd>TroubleToggle lsp_workspace_diagnostics<CR>' },
                    { '.', '<Cmd>TroubleToggle lsp_document_diagnostics<CR>' },
                    { 'r', '<Cmd>TroubleToggle lsp_references<CR>' },
                    { 'q', '<Cmd>TroubleToggle quickfix<CR>' },
                    { 'l', '<Cmd>TroubleToggle loclist<CR>' },
                }},
                { 't', {
                    { 'n', '<Cmd>FloatermNew<CR>' },
                }},
            }},
        }},
    }},
}
