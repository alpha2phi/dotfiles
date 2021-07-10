local api, fn, cmd, g, ft = vim.api, vim.fn, vim.cmd, vim.g, vim.bo.filetype
local G = require("global")

local Git = {}

-- Show git information in virtual text for current line like GitLens
function Git.blameVirtText()
    local _ft = vim.fn.expand('%:h:t') -- get the current file extension
    if _ft == '' then -- if we are in a scratch buffer or unknown filetype
        return
    end
    if _ft == 'bin' then -- if we are in api.m's terminal window
        return
    end
    local currFile = vim.fn.expand('%')
    if not vim.fn.filereadable(currFile) then return end
    api.nvim_buf_clear_namespace(0, 2, 0, -1) -- clear out virtual text from namespace 2 (the namespace we will set later)
    local line = api.nvim_win_get_cursor(0)
    local blame = vim.fn.system(string.format('git blame -c -L %d,%d %s', line[1], line[1], currFile))
    local hash = vim.split(blame, '%s')[1]
    local cmd = string.format("git show %s ", hash) .. "--format=' : %an | %ar | %s'"
    if hash == '00000000' then
        text = 'Not Committed Yet'
    else
        text = vim.fn.system(cmd)
        text = vim.split(text, '\n')[1]
        if text:find("fatal") then
            -- if the call to git show fails
            text = 'Not Committed Yet'
        end
    end
    -- set virtual text for namespace 2 with the content from git and assign it to the higlight group 'GitLens'
    api.nvim_buf_set_virtual_text(0, 2, line[1] - 1, {{text, 'GitLens'}}, {})
end

--- Clearing out the virtual text
function Git.clearBlameVirtText()
    api.nvim_buf_clear_namespace(0, 2, 0, -1)
end

local function get_dir_contains(path, dirname)
    -- return parent path for specified entry (either file or directory)
    local function pathname(path)
        local prefix = ""
        local i = path:find("[\\/:][^\\/:]*$")
        if i then
            prefix = path:sub(1, i - 1)
        end
        return prefix
    end

    -- Navigates up one level
    local function up_one_level(path)
        if path == nil then
            path = "."
        end
        if path == "." then
            path = io.popen "cd":read "*l"
        end
        return pathname(path)
    end

    -- Checks if provided directory contains git directory
    local function has_specified_dir(path, specified_dir)
        if path == nil then
            path = "."
        end
        return G.isdir(path .. "/" .. specified_dir)
    end

    -- Set default path to current directory
    if path == nil then
        path = "."
    end

    -- If we're already have .git directory here, then return current path
    if has_specified_dir(path, dirname) then
        return path .. "/" .. dirname
    else
        -- Otherwise go up one level and make a recursive call
        local parent_path = up_one_level(path)
        if parent_path == path then
            return nil
        else
            return get_dir_contains(parent_path, dirname)
        end
    end
end

-- adapted from from clink-completions' git.lua
function Git.get_root_dir(path)
    -- return parent path for specified entry (either file or directory)
    local function pathname(path)
        local prefix = ""
        local i = path:find("[\\/:][^\\/:]*$")
        if i then
            prefix = path:sub(1, i - 1)
        end

        return prefix
    end

    -- Checks if provided directory contains git directory
    local function has_git_dir(dir)
        local git_dir = dir .. "/.git"
        if G.isdir(git_dir) then
            return git_dir
        end
    end

    local function has_git_file(dir)
        local gitfile = io.open(dir .. "/.git")
        if not gitfile then
            return false
        end

        local git_dir = gitfile:read():match("gitdir: (.*)")
        gitfile:close()

        return git_dir and dir .. "/" .. git_dir
    end

    -- Set default path to current directory
    if not path or path == "." then
        path = io.popen "cd":read "*l"
    end

    -- Calculate parent path now otherwise we won't be
    -- able to do that inside of logical operator
    local parent_path = pathname(path)

    return has_git_dir(path)
        or has_git_file(path)
        -- Otherwise go up one level and make a recursive call
        or (parent_path ~= path and Git.get_root_dir(parent_path) or nil)
end

function Git.check_workspace()
    local current_file = fn.expand("%:p")
    if current_file == '' or current_file == nil then return false end
    local current_dir
    -- if file is a symlinks
    if fn.getftype(current_file) == "link" then
        local real_file = fn.resolve(current_file)
        current_dir = fn.fnamemodify(real_file, ":h")
    else
        current_dir = fn.expand("%:p:h")
    end
    local result = Git.get_root_dir(current_dir)
    if not result then
        return false
    end
    return true
end

function Git.get_branch()
    if ft == "help" then
        return
    end
    local current_file = fn.expand("%:p")
    local current_dir

    -- if file is a symlinks
    if fn.getftype(current_file) == "link" then
        local real_file = fn.resolve(current_file)
        current_dir = fn.fnamemodify(real_file, ":h")
    else
        current_dir = fn.expand("%:p:h")
    end

    local _, gitbranch_pwd = pcall(api.nvim_buf_get_var, 0, "gitbranch_pwd")
    local _, gitbranch_path = pcall(api.nvim_buf_get_var, 0, "gitbranch_path")
    if gitbranch_path and gitbranch_pwd then
        if gitbranch_path:find(current_dir) and string.len(gitbranch_pwd) ~= 0 then
            return gitbranch_pwd
        end
    end
    local git_dir = Git.get_root_dir(current_dir)
    if not git_dir then
        return
    end
    local git_root
    if not git_dir:find("/.git") then
        git_root = git_dir
    end
    git_root = git_dir:gsub("/.git", "")

    -- If git directory not found then we're probably outside of repo
    -- or something went wrong. The same is when head_file is nil
    local head_file = git_dir and io.open(git_dir .. "/HEAD")
    if not head_file then
        return
    end

    local HEAD = head_file:read()
    head_file:close()

    -- if HEAD matches branch expression, then we're on named branch
    -- otherwise it is a detached commit
    local branch_name = HEAD:match("ref: refs/heads/(.+)")
    if branch_name == nil then
        return
    end

    api.nvim_buf_set_var(0, "gitbranch_pwd", branch_name)
    api.nvim_buf_set_var(0, "gitbranch_path", git_root)

    return branch_name .. " "
end

function Git.run()
    local gStatus = Git.check_workspace()
    if gStatus == true then

        local options = {noremap = true, silent = true}
        api.nvim_command("augroup vcsGit")
        if fn.executable('nvr') then
	        cmd "let $GIT_EDITOR = \"nvr -cc split --remote-wait +'set bufhidden=wipe'\""
        end

        -- Get Which-Key keymap
        key_maps = vim.g.which_key_map

        -- Add keys to Which-Key keymap
        key_maps.g = {
            name = "Git",
            b = "Branch",
            c = "Commit",
            C = "Commit --amend",
            f = "Files",
            L = "Log",
            m = "Messenger",
            S = "Status",
            t = "Tag",
        }

        api.nvim_command("autocmd!")
        api.nvim_command("autocmd CursorHold * lua require'myplugins/vcs/git/gitlens'.blameVirtText()")
        api.nvim_command("autocmd CursorMoved * lua require'myplugins/vcs/git/gitlens'.clearBlameVirtText()")
        api.nvim_command("autocmd CursorMovedI * lua require'myplugins/vcs/git/gitlens'.clearBlameVirtText()")
        api.nvim_command("augroup END")
        if fn.executable("lazygit") then
            api.nvim_command("command! LazyGit lua require'myplugins/vcs/git/lazygit'.lazygit()")
            api.nvim_command("command! LazyGitFilter lua require'myplugins/vcs/git/lazygit'.lazygitfilter()")
            api.nvim_command("command! LazyGitConfig lua require'myplugins/vcs/git/lazygit'.lazygitconfig()")
            api.nvim_set_keymap("n", "<Space>gl", "lua require'myplugins/vcs/git/lazygit'.lazygit()<CR>", options)
            key_maps.g.l = "LazyGit"
        end
        if fn.executable("gitui") then
            api.nvim_command("command! GitUI lua require'myplugins/vcs/git/gitui'.gitui()")
            api.nvim_set_keymap("n", "<Space>gl", "lua require'myplugins/vcs/git/gitui'.gitui()<CR>", options)
            key_maps.g.l = "GitUI"
        end
        -- Git Signs
        api.nvim_command("packadd gitsigns.nvim")
        -- Gina
        vim.api.nvim_command("packadd gina.vim")

        -- Git Messenger
        api.nvim_command("packadd git-messenger.vim")

        -- Git Commit
        api.nvim_command("packadd committia.vim")

        -- Update Which-Key keymap
        vim.g.which_key_map = key_maps
    else
        api.nvim_command("augroup vcsGit")
        api.nvim_command("autocmd!")
        api.nvim_command("augroup END")

        -- Get Which-Key keymap
        key_maps = vim.g.which_key_map

        -- Remove keys from Which-Key keymap
        if key_maps.g ~=nil then
            key_maps.g = nil
        end

        -- Update Which-Key keymap
        vim.g.which_key_map = key_maps
    end
end

return Git
