local Job = require "plenary.job"

local M = {}

local API_KEY_FILE = vim.env.HOME .. "/.config/openai-codex/env"
local OPENAI_URL = "https://api.openai.com/v1/engines/davinci-codex/completions"
-- local OPENAI_URL = "https://api.openai.com/v1/engines/cushman-codex/completions"
local MAX_TOKENS = 300

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

local function trim(s)
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function M.complete(v)
  v = v or true
  local ft = vim.bo.filetype
  local buf = vim.api.nvim_get_current_buf()

  local api_key = get_api_key()
  if api_key == nil then
    vim.notify "OpenAI API key not found"
    return
  end

  local text = ""
  if v then
    local line1 = vim.api.nvim_buf_get_mark(0, "<")[1]
    local line2 = vim.api.nvim_buf_get_mark(0, ">")[1]
    text = vim.api.nvim_buf_get_lines(buf, line1 - 1, line2, false)
    text = trim(table.concat(text, "\n"))
  else
    text = trim(vim.api.nvim_get_current_line())
  end
  local cs = vim.bo.commentstring
  text = string.format(cs .. "\n%s", ft, text)

  -- vim.notify(text)

  local request = {}
  request["max_tokens"] = MAX_TOKENS
  request["top_p"] = 1
  request["temperature"] = 0
  request["frequency_penalty"] = 0
  request["presence_penalty"] = 0
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
  }
  local is_completed = pcall(job.sync, job, 10000)
  if is_completed then
    local result = job:result()
    local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))
    if not ok then
      vim.notify "Failed to parse OpenAI result"
      return
    end

    if parsed["choices"] ~= nil then
      completion = parsed["choices"][1]["text"]
      local lines = {}
      local delimiter = "\n"

      for match in (completion .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(lines, match)
      end
      vim.api.nvim_buf_set_lines(buf, -1, -1, false, lines)
    end
  end
end

return M
