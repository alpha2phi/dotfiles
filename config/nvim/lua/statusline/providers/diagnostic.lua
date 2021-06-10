local vim, lsp, api = vim, vim.lsp, vim.api
local i = require("statusline.icons")

local M = {}

-- nvim-lspconfig
-- see https://github.com/neovim/nvim-lspconfig
local function get_nvim_lsp_diagnostic(diag_type)
  if vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return ""
  end

  local active_clients = lsp.get_active_clients()

  if active_clients then
    local count = 0

    for _, client in ipairs(active_clients) do
      count = count + lsp.diagnostic.get_count(api.nvim_get_current_buf(), diag_type, client.id)
    end

    if count ~= 0 then
      return count
    end
  end
end

function M.get_diagnostic_error()
  if not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return get_nvim_lsp_diagnostic("Error")
  end
  return ""
end

function M.get_diagnostic_warn()
  if not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return get_nvim_lsp_diagnostic("Warning")
  end
  return ""
end

function M.get_diagnostic_hint()
  if not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return get_nvim_lsp_diagnostic("Hint")
  end
  return ""
end

function M.get_diagnostic_info()
  if not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    return get_nvim_lsp_diagnostic("Information")
  end
  return ""
end

function M.has_diagnostics()
  local c = 0
  if not vim.tbl_isempty(lsp.buf_get_clients(0)) then
    if get_nvim_lsp_diagnostic("Error") ~= nil and get_nvim_lsp_diagnostic("Error") > 0 then
      c = c + get_nvim_lsp_diagnostic("Error")
    end
    if get_nvim_lsp_diagnostic("Warning") ~= nil and get_nvim_lsp_diagnostic("Warning") > 0 then
      c = c + get_nvim_lsp_diagnostic("Warning")
    end
    if get_nvim_lsp_diagnostic("Hint") ~= nil and get_nvim_lsp_diagnostic("Hint") > 0 then
      c = c + get_nvim_lsp_diagnostic("Hint")
    end
    if get_nvim_lsp_diagnostic("Information") ~= nil and get_nvim_lsp_diagnostic("Information") > 0 then
      c = c + get_nvim_lsp_diagnostic("Information")
    end
  end
  if c > 0 then
    return true
  else
    return false
  end
end

function M.end_space()
  if not M.has_diagnostics() then
    return ""
  else
    return " "
  end
  return ""
end

function M.seperator()
  if not M.has_diagnostics() then
    return ""
  else
    return i.slant.Left
  end
end

return M
