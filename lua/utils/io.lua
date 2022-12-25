local M = {}

function M.put(...)
  local objects = {}
  local result = ""

  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  result = result .. table.concat(objects, '\n')
  print(table.concat(objects, '\n'))

  return result
end

function M.readFile(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*a")
  f:close()
  return content
end

function M.map(mode, lhs, rhs, opts, reverse_repeat)
  local default_opts = { silent = true }
  opts = type(opts) == "table" and my.struc.table_merge(default_opts, opts, { expr = true }) or
      my.struc.table_merge(default_opts, { expr = true })

  local function repeat_cmd(forward, cmd, _opts, desc)
    local C = {}
    local wording = forward and "repeat" or "reverse"
    desc = desc and (wording .. ": " .. desc) or (wording .. " last action")
    local isExpr = type(cmd) == "function"
    local additional_opts = isExpr and my.struc.table_merge({ desc = desc }, { replace_keycodes = true, expr = true }) or
        { desc = desc }
    _opts = my.struc.table_merge(_opts or {}, additional_opts)

    if (not forward) and type(cmd) == "string" and string.match(cmd, "<%a%-%w+>") then
      function C.Cmd()
        vim.fn.execute("normal " .. vim.api.nvim_replace_termcodes(cmd, true, true, true))
      end
    end

    vim.keymap.set("n", forward and "." or ",", C.Cmd or cmd, _opts)
  end

  local function compile_cmd()
    local defaults = { mode = mode, lhs = lhs, rhs = rhs, opts = default_opts,
      desc = opts.desc or nil }
    local reverse_rhs = reverse_repeat or "<Nop>"
    local my_cmd = rhs

    return function()
      if mode == "n" then
        repeat_cmd(true, rhs, defaults.opts, defaults.desc or nil)
        repeat_cmd(false, reverse_rhs, defaults.opts, defaults.desc or nil)
      end

      if type(my_cmd) == "function" then
        my_cmd()

        return
      end

      return my_cmd
    end
  end

  vim.keymap.set(mode, lhs, compile_cmd(), opts)
end

function M.apply_keymaps(mode, keymaps, lhs)
  lhs = lhs or ""

  for k, v in ipairs(keymaps) do
    if not (type(v) == "table") and k > 2 then
      return
    elseif type(v) == "table" then
      if #keymaps > 2 and type(keymaps[1]) == "string" and type(keymaps[2]) == "table" and type(keymaps[3]) == "string" then
        vim.keymap.set(mode, lhs, "<Nop>", { silent = true, remap = true, noremap = false, desc = keymaps[3] })
      end
      M.apply_keymaps(mode, v, lhs)
    elseif type(v) == "string" and k == 1 then
      lhs = lhs .. v
    elseif k == 2 and (type(v) == "string" or type(v) == "function") then
      my.io.map(mode, lhs, v, { desc = (#keymaps > 2) and keymaps[3] or lhs }, (#keymaps > 3) and keymaps[4] or nil)
    else
      vim.notify_once("Error in keymapping:" .. mode .. ":<" .. lhs .. ">, <= lhs is a function, should be a string!")
    end
  end
end

return M
