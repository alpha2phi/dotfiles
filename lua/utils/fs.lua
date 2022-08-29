local M = {}

function M.which(executable)
  if jit.os == "Windows" then
    return vim.fn.system({ "(gcm " .. executable .. ").Source" })
  else
    return vim.fn.system({ "which", executable })
  end
end

M.path_sep = jit.os == "Windows" and "\\" or "/"

M.dir = {
  cache = vim.fn.stdpath("cache"),
  data = vim.fn.stdpath("data"),
  cfg = vim.fn.stdpath("config"),
  plugins = vim.fn.stdpath("config") .. M.path_sep .. "site" .. M.path_sep .. "pack" .. M.path_sep,
  home = vim.fn.getenv("HOME"),
}
M.path = {
  python2 = M.which("python2"),
  python3 = M.which("python3"),
  python = M.which("python"),
  node = M.which("neovim-node-host")
}

--- Check if a file or directory exists in this path
function M.exists(fileOrDir)
  if fileOrDir == "" or fileOrDir == nil then
    return false
  end
  local ok, err, code = vim.fn.rename(fileOrDir, fileOrDir)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

--- Check if a directory exists in this path
function M.isdir(path)
  if path == "" or path == nil then
    return false
  end
  -- "/" works on both Unix and Windows
  return M.exists(path .. "/")
end

return M
