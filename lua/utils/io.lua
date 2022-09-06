local M = {}

function M.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

function M.readFile(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*a")
  f:close()
  return content
end

function M.map(mode, lhs, rhs, opts, reverse_repeat)
  local default_opts = { silent = true, noremap = true }
  opts = type(opts) == "table" and my.struc.table_merge(default_opts, opts, { expr = true }) or
      my.struc.table_merge(default_opts, { expr = true })

  local function repeat_cmd(forward, cmd, _opts, desc)
    local wording = forward and "repeat" or "reverse"
    desc = desc and (wording .. ": " .. desc) or (wording .. " last action")
    local isExpr = type(cmd) == "function"
    local additional_opts = isExpr and my.struc.table_merge({ desc = desc }, { replace_keycodes = true, expr = true }) or
        { desc = desc }
    _opts = my.struc.table_merge(_opts or {}, additional_opts)

    if (not forward) and type(cmd) == "string" and string.match(cmd, "<%a%-%w+>") then
      function Cmd()
        vim.fn.execute("normal " .. vim.api.nvim_replace_termcodes(cmd, true, true, true))
      end
    end

    vim.keymap.set("n", forward and "." or ",", Cmd or cmd, _opts)
  end

  local function compile_cmd()
    local defaults = { mode = mode, lhs = lhs, rhs = rhs, opts = default_opts,
      desc = opts.desc or nil }
    local reverse_rhs = reverse_repeat or "<Nop>"
    local my_cmd = rhs

    return function()
      if type(my_cmd) == "function" then
        my_cmd()
        my_cmd = "<Nop>"
      end
      repeat_cmd(true, rhs, defaults.opts, defaults.desc or nil)
      repeat_cmd(false, reverse_rhs, defaults.opts, defaults.desc or nil)
      return my_cmd
    end
  end

  vim.keymap.set(mode, lhs, compile_cmd(), opts)
end

return M
