local api, fn, cmd, g, ft = vim.api, vim.fn, vim.cmd, vim.g, vim.bo.filetype

local Git = {}

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
      path = io.popen("cd"):read("*l")
    end
    return pathname(path)
  end

  -- Checks if provided directory contains git directory
  local function has_specified_dir(path, specified_dir)
    if path == nil then
      path = "."
    end
    return isdir(path .. "/" .. specified_dir)
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
    if isdir(git_dir) then
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
    path = io.popen("cd"):read("*l")
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
  if current_file == "" or current_file == nil then
    return false
  end
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

  return branch_name or ""
end

return Git
