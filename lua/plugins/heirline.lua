local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
-- local constructors = require("heirline.constructors")

local function vimode_color()
  return my.color.my.vimode[vim.fn.mode()] or my.color.my.vimode["n"]
end

local function setup_colors()
  local dark_mode = vim.opt.background:get() == "dark"

  return {
    vimode = vimode_color(),
    light = my.color.my.light,
    dark = my.color.my.dark,
    current_bg = dark_mode and my.color.my.dark or my.color.my.light,
    current_fg = dark_mode and my.color.my.light or my.color.my.dark,
    red = my.color.my.red,
    magenta = my.color.my.magenta,
    green = my.color.my.green,
    blue = my.color.my.blue,
    gray = utils.get_highlight("NonText").fg,
    yellow = my.color.my.yellow,
    orange = my.color.my.orange,
    purple = my.color.my.purple,
    aqua = my.color.my.aqua,
    diag_warn = my.color.my.orange,
    diag_error = my.color.my.red,
    diag_hint = my.color.my.yellow,
    diag_info = my.color.my.aqua,
    git_del = my.color.my.red,
    git_add = my.color.my.green,
    git_change = my.color.my.yellow
  }
end

local SlantRightRight = {
  hl = { fg = "magenta", bg = "vimode" },
  provider = ""
}
local SlantRightLeft = {
  hl = { fg = "vimode", bg = "magenta" },
  provider = ""
}
local SlantLeftLeft = {
  hl = { fg = "magenta", bg = "vimode" },
  provider = ""
}
local SlantLeftRight = {
  hl = { fg = "vimode", bg = "magenta" },
  provider = ""
}

local Space = { provider = " " }

local ViMode = {
  init = function(self)
    self.mode = vim.fn.mode()
  end,
  static = {
    mode_names = {
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
  },
  provider = function(self)
    return self.mode_names[self.mode]
  end,
  hl = function(self)
    return { fg = "dark", bg = "magenta", bold = true }
  end,
  -- update = {
  --     "ModeChanged",
  --     callback = function()
  --         vim.cmd("redrawstatus")
  --     end,
  -- },
}

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
      filename,
      extension,
      { default = true }
    )
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = { fg = "dark", bg = "magenta" },
}

local FileName = {
  init = function(self)
    self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
    if self.lfilename == "" then
      self.lfilename = "[No Name]"
    end
    if not conditions.width_percent_below(#self.lfilename, 0.27) then
      self.lfilename = vim.fn.pathshorten(self.lfilename)
    end
  end,
  hl = { fg = "dark", bg = "magenta" },
  provider = function(self)
    return self.lfilename
  end,
  --provider = function(self)
  --  return vim.fn.pathshorten(self.lfilename)
  --end,
}

local FileFlags = {
  {
    provider = function()
      if vim.bo.modified then
        return " [+]"
      end
    end,
    hl = { fg = "green" },
  },
  {
    provider = function()
      if not vim.bo.modifiable or vim.bo.readonly then
        return " "
      end
    end,
    hl = { fg = "red" },
  },
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      return { fg = "aqua", bold = true, force = true }
    end
  end,
}

FileNameBlock = utils.insert(FileNameBlock, { provider = " " }, FileIcon, utils.insert(FileNameModifer, FileName),
  unpack(FileFlags))

local FileType = {
  provider = function()
    return string.upper(vim.bo.filetype)
  end,
  hl = { fg = "dark" },
}

local FileEncoding = {
  provider = function()
    local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
    return enc ~= "utf-8" and enc:upper()
  end,
}

local FileFormat = {
  provider = function()
    local fmt = vim.bo.fileformat
    return fmt ~= "unix" and fmt:upper()
  end,
}

local FileSize = {
  provider = function()
    -- stackoverflow, compute human readable file size
    local suffix = { "b", "k", "M", "G", "T", "P", "E" }
    local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
    fsize = (fsize < 0 and 0) or fsize
    if fsize <= 0 then
      return "0" .. suffix[1]
    end
    local i = math.floor((math.log(fsize) / math.log(1024)))
    return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i])
  end,
}

local FileLastModified = {
  provider = function()
    local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
    return (ftime > 0) and os.date("%c", ftime)
  end,
}

local Ruler = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  provider = "%7(%l/%3L%):%2c %P",
}

local ScrollBar = {
  static = {
    sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor(curr_line / lines * (#self.sbar - 1)) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = { fg = "magenta", bg = "current_bg" },
}

local LSPActive = {
  condition = conditions.lsp_attached,
  update = { "LspAttach", "LspDetach" },

  provider = " LSP",

  -- Or complicate things a bit and get the servers names
  -- provider  = function(self)
  --     local names = {}
  --     for i, server in ipairs(vim.lsp.buf_get_clients(0)) do
  --         table.insert(names, server.name)
  --     end
  --     return " [" .. table.concat(names, " ") .. "]"
  -- end,
  hl = { fg = "green", bg = "magenta", bold = true },
  on_click = {
    name = "heirline_LSP",
    callback = function()
      vim.defer_fn(function()
        vim.cmd("LspInfo")
      end, 100)
    end,
  },
}

local Navic = {
  condition = require("nvim-navic").is_available,
  static = {
    -- create a type highlight map
    type_hl = {
      File = "Directory",
      Module = "@include",
      Namespace = "@namespace",
      Package = "@include",
      Class = "@structure",
      Method = "@method",
      Property = "@property",
      Field = "@field",
      Constructor = "@constructor",
      Enum = "@field",
      Interface = "@type",
      Function = "@function",
      Variable = "@variable",
      Constant = "@constant",
      String = "@string",
      Number = "@number",
      Boolean = "@boolean",
      Array = "@field",
      Object = "@type",
      Key = "@keyword",
      Null = "@comment",
      EnumMember = "@field",
      Struct = "@structure",
      Event = "@keyword",
      Operator = "@operator",
      TypeParameter = "@type",
    },
    -- bit operation dark magic, see below...
    enc = function(line, col, winnr)
      return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
    end,
    -- line: 16 bit (65535); col: 10 bit (1023); winnr: 6 bit (63)
    dec = function(c)
      local line = bit.rshift(c, 16)
      local col = bit.band(bit.rshift(c, 6), 1023)
      local winnr = bit.band(c, 63)
      return line, col, winnr
    end
  },
  init = function(self)
    local data = require("nvim-navic").get_data() or {}
    local children = {}
    -- create a child for each level
    for i, d in ipairs(data) do
      -- encode line and column numbers into a single integer
      local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr)
      local child = {
        {
          provider = d.icon,
          hl = self.type_hl[d.type],
        },
        {
          -- escape `%`s (elixir) and buggy default separators
          provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ''),
          -- highlight icon only or location name as well
          -- hl = self.type_hl[d.type],

          on_click = {
            -- pass the encoded position through minwid
            minwid = pos,
            callback = function(_, minwid)
              -- decode
              local line, col, winnr = self.dec(minwid)
              vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { line, col })
            end,
            name = "heirline_navic",
          },
        },
      }
      -- add a separator only if needed
      if #data > 1 and i < #data then
        table.insert(child, {
          provider = " > ",
          hl = { fg = 'bright_fg' },
        })
      end
      table.insert(children, child)
    end
    -- instantiate the new child, overwriting the previous one
    self.child = self:new(children, 1)
  end,
  -- evaluate the children containing navic components
  provider = function(self)
    return self.child:eval()
  end,
  hl = { fg = my.color.my.dark },
  update = { "CursorMoved", "ModeChanged" }
}

local Diagnostics = {

  condition = conditions.has_diagnostics,
  update = { "DiagnosticChanged", "BufEnter" },
  on_click = {
    callback = function()
      require('diaglist').populate_llist()
      vim.cmd("LLOpen!")
    end,
    name = "heirline_diagnostics",
  },

  static = {
    error_icon = vim.fn.sign_getdefined("DiagnosticSignError").text,
    warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn").text,
    info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo").text,
    hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint").text,
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  {
    provider = function(self)
      return self.errors > 0 and ((self.error_icon or " ") .. self.errors .. " ")
    end,
    hl = { fg = my.color.util.darken(my.color.my.red, 33) },
  },
  {
    provider = function(self)
      return self.warnings > 0 and ((self.warn_icon or " ") .. self.warnings .. " ")
    end,
    hl = { fg = my.color.util.darken(my.color.my.orange, 33) },
  },
  {
    provider = function(self)
      return self.info > 0 and ((self.info_icon or "") .. self.info .. " ")
    end,
    hl = { fg = my.color.util.darken(my.color.my.aqua, 33) },
  },
  {
    provider = function(self)
      return self.hints > 0 and ((self.hint_icon or "") .. self.hints)
    end,
    hl = { fg = my.color.util.darken(my.color.my.green, 33) },
  },
}

local Git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  on_click = {
    callback = function(self, minwid, nclicks, button)
      vim.cmd("Neogit")
    end,
    name = "heirline_git",
    update = false,
  },

  hl = { fg = "dark", bg = "magenta" },

  Space,
  {
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = { bold = true },
  },
  Space,
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "[",
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count)
    end,
    hl = { fg = "green" },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = { fg = "red" }
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = { fg = "orange" },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "]",
  },
  Space,
}

local Snippets = {
  condition = function()
    return vim.tbl_contains({ "s", "i" }, vim.fn.mode())
  end,
  provider = function()
    local forward = (vim.fn["UltiSnips#CanJumpForwards"]() == 1) and "" or ""
    local backward = (vim.fn["UltiSnips#CanJumpBackwards"]() == 1) and " " or ""
    return backward .. forward
  end,
  hl = { fg = "red", bold = true },
}

-- local DAPMessages = {
--   condition = function()
--     local session = require("dap").session()
--     if session then
--       local filename = vim.api.nvim_buf_get_name(0)
--       if session.config then
--         local progname = session.config.program
--         return filename == progname
--       end
--     end
--     return false
--   end,
--   provider = function()
--     return " " .. require("dap").status()
--   end,
--   hl = "Debug",
--   --       ﰇ  
-- }

-- local UltTest = {
--     condition = function()
--         return vim.api.nvim_call_function("ultest#is_test_file", {}) ~= 0
--     end,
--     static = {
--         passed_icon = vim.fn.sign_getdefined("test_pass")[1].text,
--         failed_icon = vim.fn.sign_getdefined("test_fail")[1].text,
--         passed_hl = { fg = utils.get_highlight("UltestPass").fg },
--         failed_hl = { fg = utils.get_highlight("UltestFail").fg },
--     },
--     init = function(self)
--         self.status = vim.api.nvim_call_function("ultest#status", {})
--     end,
--     {
--         provider = function(self)
--             return self.passed_icon .. self.status.passed .. " "
--         end,
--         hl = function(self)
--             return self.passed_hl
--         end,
--     },
--     {
--         provider = function(self)
--             return self.failed_icon .. self.status.failed .. " "
--         end,
--         hl = function(self)
--             return self.failed_hl
--         end,
--     },
--     {
--         provider = function(self)
--             return "of " .. self.status.tests - 1
--         end,
--     },
-- }

local WorkDir = {
  provider = function(self)
    self.icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
    local cwd = vim.fn.getcwd(0)
    self.cwd = vim.fn.fnamemodify(cwd, ":~")
    if not conditions.width_percent_below(#self.cwd, 0.27) then
      self.cwd = vim.fn.pathshorten(self.cwd)
    end
  end,
  hl = { fg = "dark", bold = true },
  on_click = {
    callback = function()
      vim.cmd('Ranger')
    end,
    name = "heirline_workdir",
  },

  {
    provider = function(self)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return self.icon .. self.cwd:gsub("~/.local/git", "") .. trail .. " "
    end,
  },
  --{
  --  provider = function(self)
  --    local cwd = vim.fn.pathshorten(self.cwd)
  --    local trail = self.cwd:sub(-1) == "/" and "" or "/"
  --    return self.icon .. cwd .. trail .. " "
  --  end,
  --},
}

local HelpFilename = {
  condition = function()
    return vim.bo.filetype == "help"
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ":t")
  end,
  hl = { fg = "current_fg" },
}

local TerminalName = {
  -- icon = ' ', -- 
  {
    provider = function()
      local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
      return " " .. tname
    end,
    hl = { fg = "blue", bold = true },
  },
  { provider = " - " },
  {
    provider = function()
      return vim.b.term_title
    end,
  },
  {
    provider = function()
      local id = require("terminal"):current_term_index()
      return " " .. (id or "Exited")
    end,
    hl = { bold = true, fg = "blue" },
  },
}

local Spell = {
  condition = function()
    return vim.wo.spell
  end,
  provider = "SPELL ",
  hl = { bold = true, fg = "yellow" },
}

local Align = { provider = "%=" }

local DefaultStatusline = {
  {
    ViMode,
    SlantRightRight,
  },
  Space,
  Spell,
  Space,
  {
    hl = { bg = "magenta" },
    SlantLeftRight,
    WorkDir,
    SlantRightRight,
  },
  Space,
  {
    hl = { bg = "magenta" },
    SlantLeftRight,
    Git,
    SlantRightRight,
  },
  Space,
  { provider = "%<" },
  {
    hl = { bg = "magenta" },
    SlantLeftRight,
    FileNameBlock,
    Space,
    SlantRightRight,
  },
  Space,
  {
    condition = conditions.has_diagnostics,
    SlantLeftRight,
    { hl = { bg = "magenta", force = true }, Space, Diagnostics, Space },
    { hl = { bg = "vimode", force = true }, SlantRightRight },
    { hl = { fg = "current_fg", bg = "vimode", force = true }, Space }
  },
  {
    hl = { bg = "magenta", bold = true },
    SlantLeftRight,
    Space,
    { hl = { fg = "dark", bold = true, force = true }, Navic },
    Space,
    SlantRightRight,
  },
  Space,
  Align,
  -- DAPMessages,
  SlantLeftLeft,
  {
    hl = { bg = "magenta", force = true },
    Space,
    LSPActive,
    Space,
  },
  SlantRightLeft,
  -- UltTest,
  Space,
  {
    hl = { bg = "magenta" },
    SlantLeftLeft,
    Space,
    FileType,
    Space,
    SlantRightLeft,
  },
  Space,
  {
    hl = { bg = "magenta" },
    SlantLeftLeft,
    Space,
    FileEncoding,
    FileLastModified,
    Space,
    SlantRightLeft,
  },
  Space,
  {
    hl = { bg = "magenta" },
    SlantLeftLeft,
    Space,
    Ruler,
  },
  ScrollBar,
}

local InactiveStatusline = {
  condition = function()
    return not conditions.is_active()
  end,
  { hl = { fg = "gray", force = true }, WorkDir },
  FileNameBlock,
  { provider = "%<" },
  Align,
}

local SpecialStatusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = { "nofile", "prompt", "help", "quickfix" },
      filetype = { "^git.*", "fugitive" },
    })
  end,
  FileType,
  { provider = "%q" },
  Space,
  HelpFilename,
  Align,
}

local GitStatusline = {
  condition = function()
    return conditions.buffer_matches({
      filetype = { "^git.*", "fugitive" },
    })
  end,
  FileType,
  Space,
  {
    provider = function()
      return vim.fn.FugitiveStatusline()
    end,
  },
  Space,
  Align,
}

local TerminalStatusline = {
  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  hl = { bg = "magenta" },
  { condition = conditions.is_active, ViMode, Space },
  FileType,
  Space,
  -- TerminalName,
  Align,
}

local StatusLines = {
  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,
  static = {
    mode_color = function(self)
      local mode = conditions.is_active() and vim.fn.mode() or "n"
      local current_mode_color = my.color.my.vimode[mode]

      vim.api.nvim_set_hl(0, "StatusLine", { bg = current_mode_color })
      return current_mode_color
    end,
  },

  fallthrough = false,

  GitStatusline,
  SpecialStatusline,
  TerminalStatusline,
  InactiveStatusline,
  DefaultStatusline,
}

local CloseButton = {
  condition = function(self)
    return not vim.bo.modified
  end,
  -- update = 'BufEnter',
  update = { "WinNew", "WinClosed", "BufEnter" },
  { provider = " " },
  {
    provider = "",
    hl = { fg = "gray" },
    on_click = {
      callback = function(_, winid)
        vim.api.nvim_win_close(winid, true)
      end,
      name = function(self)
        return "heirline_close_button_" .. self.winnr
      end,
      update = true,
    },
  },
}

local WinBar = {
  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "WinBarNC"
    end
  end,
  {
    hl = { fg = my.color.my.dark, bg = my.color.my.magenta, force = true },
    Space,
    FileNameBlock,
    Space,
  },
  {
    hl = { fg = "magenta" },
    provider = ""
  },
  {
    -- flexible = 1,
    condition = function()
      if require('nvim-navic').is_available() then
        local data = require('nvim-navic').get_data()
        local data_len = 0

        for _, _ in pairs(data or {}) do
          data_len = data_len + 1
        end

        return data_len > 0
      end

      return false
    end,
    hl = function()
      if conditions.is_active() and vim.fn.mode() ~= "n" then
        return { fg = "dark", force = true }
      end

      return { fg = "magenta", bold = true, force = true }
    end,
    Space,
    Navic,
    Space,
    {
      provider = "",
    },
  },
  Align,
  {
    condition = conditions.has_diagnostics,
    hl = function(self)
      if (not conditions.is_active()) then
        return { fg = "light", bg = nil, force = true }
      end

      return { bg = nil, force = true }
    end,
    Space,
    Diagnostics,
    Space,
    update = { "CursorMoved", "ModeChanged" }
  },
  {
    hl = { fg = my.color.my.magenta },
    provider = ""
  },
  {
    hl = { fg = my.color.my.dark, bg = my.color.my.magenta },
    provider = function(self)
      return " #" .. self.winnr
    end
  },
  update = { "CursorMoved", "ModeChanged" }
}

local WinBars = {
  fallthrough = false,
  {
    condition = function()
      vim.api.nvim_get_current_buf()
      return (not conditions.buffer_matches({
        filetype = { "lua", "clojure", "clojurescript", "clj", "cljs", "ts", "tsx", "typescript", "typescriptreact", "js",
          "jsx", "javascript", "javascriptreact", "html", "css", "json", "md", "sass", "less", "yml", "yaml" },
      }))
          or conditions.buffer_matches({
            buftype = { ".*git.*", "terminal", "nofile", "prompt", "help", "quickfix" },
            filetype = { "wilder", "packer", "neo-tree", "which-key", "Diffview.*", "NeogitStatus", ".*git.*", "^git.*",
              "fugitive" },
          })
    end,
    init = function()
      -- vim.opt_local.winbar = nil
    end,
  },
  WinBar
}

local M = {}

function M.update()
  require("heirline").reset_highlights()
  require("heirline").load_colors(setup_colors())
  require("heirline").statusline:broadcast(function(self)
    self._win_stl = nil
  end)
  require("heirline").winbar:broadcast(function(self)
    self._win_cache = nil
  end)
  vim.api.nvim_set_hl(0, "StatusLine",
    { bg = my.color.my.vimode[vim.fn.mode() or "n"] }
  )
  vim.api.nvim_set_hl(0, "ScrollbarHandle", { bg = my.color.my.vimode[vim.fn.mode() or "n"] })

end

function M.aucmds()
  vim.api.nvim_create_augroup("Heirline", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    pattern = "HeirlineInitWinbar",
    callback = function(args)
      local buf = args.buf
      local buftype = vim.tbl_contains({ "terminal", "prompt", "nofile", "help", "quickfix" }, vim.bo[buf].buftype)
      local filetype = vim.tbl_contains({ "wilder", "packer", "which-key", "Diffview.*", "NeogitStatus", "gitcommit",
        "fugitive" }, vim.bo[buf].filetype)
      if buftype or filetype then
        vim.opt_local.winbar = nil
      end
    end,
    group = "Heirline",
  })

  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = M.update,
    group = "Heirline",
  })
end

function M.load_colors()
  require("heirline").load_colors(setup_colors())
end

function M.setup(my_aucmds)
  require("heirline").load_colors(setup_colors())
  require("heirline").setup(StatusLines, WinBars)

  if my_aucmds == true then
    M.aucmds()
  end
end

return M
