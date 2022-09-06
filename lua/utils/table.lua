local M = {}

-- check value in table
function M.table_has_val(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

-- check index in table
function M.table_has_key(tab, idx)
  for index, _ in pairs(tab) do
    if index == idx then
      return true
    end
  end
  return false
end

function M.table_merge(...)
  local args = { ... }
  local merged = {}

  if #args < 2 then
    if #args == 1 then return args[1] end

    return {}
  end

  for k, v in ipairs(args) do
    if type(v) == "table" then
      for k2, v2 in pairs(v) do
        merged[k2] = v2
      end
    else
      vim.notify("table_merge: expected table, got " .. type(v) .. " at index " .. k)
    end
  end

  return merged
end

return M
