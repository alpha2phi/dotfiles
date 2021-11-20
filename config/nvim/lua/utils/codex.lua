local M = {}

local API_KEY_FILE = vim.env.HOME .. "/.config/openai-codex/env"

local function get_api_key()
  local file = io.open(API_KEY_FILE, "rb")
  if not file then
    return nil
  end
  local content = file:read "*a"
  file:close()
  return content
end

function M.complete()
  local api_key = get_api_key()
  vim.notify "api %{api_key}"
end

-- return M

M.complete()
