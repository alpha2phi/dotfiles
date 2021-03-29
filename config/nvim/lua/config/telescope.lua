require('telescope').setup{
    extensions = {
        arecibo = {
            ["selected_engine"]   = 'google',
            ["url_open_command"]  = 'open',
            ["show_http_headers"] = false,
            ["show_domain_icons"] = false,
        }
    }
}
-- require('telescope').load_extension('snippets')
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('arecibo')
require('telescope').load_extension('media_files')


local actions = require('telescope.actions')

local M = {}

M.search_dotfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/workspace/development/alpha2phi/dotfiles/",
    })
end

M.switch_projects = function() 
    require("telescope.builtin").find_files ({
        prompt_title = "< Switch Project >",
        cwd = "$HOME/workspace/development/",
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

return M

