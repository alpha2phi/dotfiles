local M = {}

function M.setup()
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('project')

    local actions = require('telescope.actions')

    require('telescope').setup {
        find_command = {
            'rg', '--no-heading', '--with-filename', '--line-number',
            '--column', '--smart-case'
        },
        use_less = true,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        extensions = {
            arecibo = {
                ["selected_engine"] = 'google',
                ["url_open_command"] = 'open',
                ["show_http_headers"] = false,
                ["show_domain_icons"] = false
            },
            fzf = {
                override_generic_sorter = false,
                override_file_sorter = true,
                case_mode = "smart_case"
            }
        },
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous
                }
            }
        }
    }

    -- require('telescope').load_extension('snippets')
    -- require('telescope').load_extension('gh')
    -- require('telescope').load_extension('hop')
    -- require('telescope').load_extension('arecibo')
    -- require('telescope').load_extension('media_files')

    M.search_dotfiles = function()
        require("telescope.builtin").find_files({
            prompt_title = "< VimRC >",
            cwd = "$HOME/workspace/dev/alpha2phi/dotfiles/"
        })
    end

    M.switch_projects = function()
        require("telescope.builtin").find_files({
            prompt_title = "< Switch Project >",
            cwd = "$HOME/workspace/dev/"
        })
    end

    M.git_branches = function()
        require("telescope.builtin").git_branches({
            attach_mappings = function(prompt_bufnr, map)
                map('i', '<c-d>', actions.git_delete_branch)
                map('n', '<c-d>', actions.git_delete_branch)
                return true
            end
        })
    end

end

return M

