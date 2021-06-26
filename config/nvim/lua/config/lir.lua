local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'

require'lir'.setup {
    show_hidden_files = true,
    devicons_enable = true,
    mappings = {
        ['l'] = actions.edit,
        ['<C-s>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,

        ['h'] = actions.up,
        ['q'] = actions.quit,

        ['d'] = actions.mkdir,
        ['%'] = actions.newfile,
        ['r'] = actions.rename,
        ['@'] = actions.cd,
        ['Y'] = actions.yank_path,
        ['.'] = actions.toggle_show_hidden,
        ['D'] = actions.delete,

        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['C'] = clipboard_actions.copy,
        ['X'] = clipboard_actions.cut,
        ['P'] = clipboard_actions.paste
    },
    float = {
        -- If you want to configure the height and width of the window individually,
        -- pass in a table like so: { width = 0.5, height = 0.8 }
        size_percentage = 0.5,
        winblend = 15,
        border = true,
        borderchars = {"╔", "═", "╗", "║", "╝", "═", "╚", "║"}

        -- -- If you want to use `shadow`, set `shadow` to `true`.
        -- -- Also, if you set shadow to true, the value of `borderchars` will be ignored.
        -- shadow = false,
    },
    hide_cursor = true
}

-- custom folder icon
require'nvim-web-devicons'.setup({
    override = {
        lir_folder_icon = {
            icon = "",
            color = "#7ebae4",
            name = "LirFolderNode"
        }
    }
})

-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J',
                                ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
                                {noremap = true, silent = true})

    -- echo cwd
    vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
