local trouble = require('trouble.providers.telescope')

require('telescope').setup {
    find_command = {
        'rg', '--no-heading', '--with-filename', '--line-number', '--column',
        '--smart-case'
    },
    use_less = true,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    extensions = {
        -- arecibo = {
        --     ["selected_engine"] = 'google',
        --     ["url_open_command"] = 'open',
        --     ["show_http_headers"] = false,
        --     ["show_domain_icons"] = false
        -- },
        fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    },
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')
require('telescope').load_extension('node_modules')
require('telescope').load_extension('session-lens')
require('telescope').load_extension('vim_bookmarks')
require('telescope').load_extension('ultisnips')
require('telescope').load_extension('projects')
-- require('telescope').load_extension('snippets')
-- require('telescope').load_extension('arecibo')
-- require('telescope').load_extension('media_files')

local bookmark_actions = require('telescope').extensions.vim_bookmarks.actions
require('telescope').extensions.vim_bookmarks.all {
    attach_mappings = function(_, map)
        map('n', 'dd', bookmark_actions.delete_selected_or_at_cursor)

        return true
    end
}
require('telescope').extensions.vim_bookmarks.current_file {
    attach_mappings = function(_, map)
        map('n', 'dd', bookmark_actions.delete_selected_or_at_cursor)

        return true
    end
}


local actions = require('telescope.actions')

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< VimRC >",
            cwd = "$HOME/.config/nvim/"
        })
end

M.switch_projects = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< Switch Project >",
            cwd = "$HOME/.local/git/"
        })
end

M.git_branches = function()
    require("telescope.builtin").git_branches(
        {
            attach_mappings = function(prompt_bufnr, map)
                map('i', '<c-d>', actions.git_delete_branch)
                map('n', '<c-d>', actions.git_delete_branch)
                return true
            end
        })
end

return M

