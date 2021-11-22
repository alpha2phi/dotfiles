local Job = require "plenary.job"

local M = {}

local API_KEY_FILE = vim.env.HOME .. "/.config/openai-codex/env"
local OPENAI_URL = "https://api.openai.com/v1/engines/davinci-codex/completions"
local MAX_TOKENS = 200

local function get_api_key()
  local file = io.open(API_KEY_FILE, "rb")
  if not file then
    return nil
  end
  local content = file:read "*a"
  content = string.gsub(content, "^%s*(.-)%s*$", "%1") -- strip off any space or newline
  file:close()
  return content
end

function M.complete()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo.filetype

  local api_key = get_api_key()
  if api_key == nil then
    vim.notify "OpenAI API key not found"
    return
  end

  local request = {}
  request["max_tokens"] = MAX_TOKENS

  local text = "# Python 3\n# Calculate the mean distance between an array of points and the origin"
  request["prompt"] = text
  local body = vim.fn.json_encode(request)

  local completion = ""
  local job = Job:new {
    command = "curl",
    args = {
      OPENAI_URL,
      "-H",
      "Content-Type: application/json",
      "-H",
      string.format("Authorization: Bearer %s", api_key),
      "-d",
      body,
    },

    on_exit = function(job)
      local result = job:result()
      local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))
      if not ok then
        vim.notify "Failed to parse OpenAI result"
        return
      end

      if parsed["choices"] ~= nil then
        completion = parsed["choices"][1]["text"]
        vim.notify(completion)
      end
    end,
  }
  job:start()
  -- job:wait(10000)
end

-- return M

M.complete()
