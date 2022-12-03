---@diagnostic disable: undefined-global
vim.opt.termguicolors = true

local config = {}

function config.setup()
  -- local gps = require("nvim-gps")

  local function vimodeColor()
    return my.color.my.vimode[vim.fn.mode()]
  end

  local function secondaryVimodeColor()
    return my.color.fn.background_blend(vimodeColor(), 70)
  end

  local function tertiaryVimodeColor()
    return my.color.fn.background_blend(vimodeColor(), 21)
  end

  local highlights = {
    background = { bg = tertiaryVimodeColor() },
    -- tab = { bg = vimodeColor() },
    -- tab_selected = { fg = vimodeColor(), bg = groups.selectionBG() },
    tab_close = { fg = my.color.my.dark, bg = vimodeColor(), bold = true },
    -- info = { fg = vimodeColor(), bg = groups.selectionBG() },
    fill = { bg = my.color.my.magenta },
    buffer = { fg = my.color.my.light, bg = secondaryVimodeColor() },
    buffer_visible = { fg = my.color.my.light, bg = secondaryVimodeColor() },
    buffer_selected = { fg = my.color.my.light, bg = vimodeColor(), bold = true },
    tab_selected = { fg = my.color.my.light, bg = vimodeColor(), bold = true },
    diagnostic = {
      fg = my.color.my.red,
      bg = tertiaryVimodeColor()
    },
    -- diagnostic_visible = {
    -- 	fg = vimodeColor(),
    -- 	bg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    -- },
    -- diagnostic = { fg = my.color.my.red, bold = true },
    diagnostic_visible = { fg = my.color.my.red, bg = secondaryVimodeColor(), bold = true },
    diagnostic_selected = { fg = my.color.my.red, bg = vimodeColor(), bold = true, italic = true },
    info = {
      fg = my.color.util.darken(my.color.my.blue, 66),
      bg = tertiaryVimodeColor()
    },
    info_visible = {
      fg = my.color.util.darken(my.color.my.blue, 66),
      bg = secondaryVimodeColor()
    },
    info_selected = {
      fg = my.color.util.darken(my.color.my.blue, 66),
      bg = vimodeColor()
    },
    hint = {
      fg = my.color.util.darken(my.color.my.yellow, 66),
      bg = tertiaryVimodeColor()
    },
    hint_visible = {
      fg = my.color.util.darken(my.color.my.yellow, 66),
      bg = secondaryVimodeColor()
    },
    hint_selected = {
      fg = my.color.util.darken(my.color.my.yellow, 66),
      bg = vimodeColor()
    },
    warning = {
      fg = my.color.util.darken(my.color.my.orange, 66),
      bg = tertiaryVimodeColor()
    },
    warning_visible = {
      fg = my.color.util.darken(my.color.my.orange, 66),
      bg = secondaryVimodeColor()
    },
    warning_selected = {
      fg = my.color.util.darken(my.color.my.orange, 66),
      bg = vimodeColor()
    },
    error = {
      fg = my.color.util.darken(my.color.my.red, 66),
      bg = tertiaryVimodeColor()
    },
    error_visible = {
      fg = my.color.util.darken(my.color.my.red, 66),
      bg = secondaryVimodeColor()
    },
    error_selected = {
      fg = my.color.util.darken(my.color.my.red, 66),
      bg = vimodeColor()
    },
    info_diagnostic = {
      fg = my.color.my.blue,
      bg = tertiaryVimodeColor()
    },
    info_diagnostic_visible = {
      fg = my.color.util.darken(my.color.my.blue, 21),
      bg = secondaryVimodeColor()
    },
    info_diagnostic_selected = {
      fg = my.color.util.darken(my.color.my.blue, 33),
      bg = vimodeColor()
    },
    hint_diagnostic = {
      fg = my.color.my.yellow,
      bg = tertiaryVimodeColor()
    },
    hint_diagnostic_visible = {
      fg = my.color.util.darken(my.color.my.yellow, 21),
      bg = secondaryVimodeColor()
    },
    hint_diagnostic_selected = {
      fg = my.color.util.darken(my.color.my.yellow, 33),
      bg = vimodeColor()
    },
    warning_diagnostic = {
      fg = my.color.my.orange,
      bg = tertiaryVimodeColor()
    },
    warning_diagnostic_visible = {
      fg = my.color.util.darken(my.color.my.orange, 21),
      bg = secondaryVimodeColor()
    },
    warning_diagnostic_selected = {
      fg = my.color.util.darken(my.color.my.orange, 33),
      bg = vimodeColor()
    },
    error_diagnostic = {
      fg = my.color.my.red,
      bg = tertiaryVimodeColor()
    },
    error_diagnostic_visible = {
      fg = my.color.util.darken(my.color.my.red, 21),
      bg = secondaryVimodeColor()
    },
    error_diagnostic_selected = {
      fg = my.color.util.darken(my.color.my.red, 33),
      bg = vimodeColor()
    },
    -- hint_selected = { fg = my.color.my.orange, bg = my.color.my.aqua, gui = "bold,italic" },
    -- warning_selected = { fg = my.color.my.red, bg = my.color.my.aqua, gui = "bold,italic" },
    -- error_visible = { fg = "#550000", bg = "#F634B1", gui = "bold,italic" },
    -- error_selected = { fg = my.color.my.red, bg = my.color.my.aqua, gui = "bold,italic" },
    -- warning = { fg = my.color.my.red, gui = "bold,italic" },
    -- error = { fg = my.color.my.red, gui = "bold,italic" },
    -- hint_diagnostic_selected = { fg = my.color.my.green, bg = my.color.my.aqua, gui = "bold,italic" },
    -- info_diagnostic_selected = { fg = my.color.my.green, bg = my.color.my.aqua, gui = "bold,italic" },
    -- warning_diagnostic_selected = { fg = my.color.my.orange, bg = my.color.my.aqua, gui = "bold,italic" },
    -- error_diagnostic_selected = { fg = my.color.my.red, bg = my.color.my.aqua, gui = "bold,italic" },
    close_button = { fg = my.color.my[vim.fn.mode()], bg = tertiaryVimodeColor() },
    -- close_button_visible = {
    -- 	fg = vimodeColor(),
    -- 	bg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    -- 	bold = true,
    -- },
    close_button_visible = { fg = my.color.my[vim.fn.mode()], bg = secondaryVimodeColor(), bold = true },
    close_button_selected = { fg = my.color.my[vim.fn.mode()], bg = vimodeColor(), bold = true },
    modified = { fg = my.color.my.red, bg = tertiaryVimodeColor() },
    modified_visible = { fg = my.color.my.red, bg = secondaryVimodeColor() },
    modified_selected = { fg = my.color.my.red, bg = vimodeColor() },
    -- duplicate_selected = { fg = my.color.my.light, bg = my.color.my.aqua },
    -- duplicate_visible = {
    -- 	fg = vimodeColor(),
    -- 	bg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    -- },
    -- duplicate = { fg = vimodeColor(), bg = groups.highlightBG() },
    separator = { fg = my.color.my.magenta, bg = tertiaryVimodeColor() },
    separator_selected = { fg = my.color.my.magenta, bg = vimodeColor() },
    separator_visible = {
      fg = my.color.my.magenta,
      bg = secondaryVimodeColor()
      -- 	bg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    },
    -- indicator_selected = { fg = vimodeColor(), bg = my.color.my.aqua },
    -- pick_selected = { fg = vimodeColor(), bg = my.color.my.aqua },
    -- background = { fg = "#FFFFFF", bg = groups.mainBG() },
  }

  local opts = {
    highlights = highlights,
    options = {
      numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both",
      close_command = "bp | bd! %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "sbuffer %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      middle_mouse_command = "sbuffer %d", -- can be a string | function, see "Mouse actions"
      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      indicator = {
        style = "icon",
        icon = "▎",
      },
      -- indicator_icon = "▎",
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
        -- remove extension from text-files for example
        -- if buf.name:match("%.txt") then
        return vim.fn.fnamemodify(buf.name, ":r")
        -- end
      end,
      max_name_length = 21,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 7,
      diagnostics = "nvim_lsp", -- false | "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or "")
          s = s .. n .. sym
        end
        return s
        -- local icon = level:match("error") and " " or " "
        -- return " " .. icon .. count
      end,
      -- NOTE: this will be called a lot so don't do any heavy processing here
      custom_filter = function(buf_number)
        -- filter out filetypes you don't want to see
        -- if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --   return true
        -- end
        -- filter out by buffer name
        -- if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --   return true
        -- end
        -- filter out based on arbitrary rules
        -- e.g. filter out vim wiki buffer from tabline in your work repo

        -- since I use tabpages as per project (usually), I filter the buffers that don't belong to the current tabpage
        -- in combination with a root/project/cwd-plugin that autosets my cwd on selection of telescope:project,
        -- which I do on creation of a new tabpage, this works fine for me
        if not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
          return true
        end
      end,
      --offsets = {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
      show_buffer_icons = false, --true | false, -- disable filetype icons for buffers
      show_buffer_close_icons = true, --true | false,
      show_close_icon = true, --true | false,
      show_tab_indicators = true, --true | false,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "slant", -- "slant"| "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false, --| true,
      always_show_bufferline = false, --| false,
      sort_by = function(buffer_a, buffer_b)
        local mod_a = ((vim.loop.fs_stat(buffer_a.path) or {}).atime or {}).sec or 0
        local mod_b = ((vim.loop.fs_stat(buffer_b.path) or {}).atime or {}).sec or 0
        return mod_a > mod_b
      end,
      --'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' |
      custom_areas = {
        left = function()
          -- local result = {}

          -- 	if gps.is_available() then
          -- 		table.insert(result, { text = gps.get_location() .. " ", fg = my.color.my.orange, bg = "black" })
          -- 		table.insert(result, { text = "   ", fg = "black", bg = vimodeColor() })
          -- 	end

          -- 	return result
          local result = {}
          local seve = vim.diagnostic.severity
          local error = #vim.diagnostic.get(nil, { severity = seve.ERROR })
          local warning = #vim.diagnostic.get(nil, { severity = seve.WARN })
          local info = #vim.diagnostic.get(nil, { severity = seve.INFO })
          local hint = #vim.diagnostic.get(nil, { severity = seve.HINT })
          -- if gps.is_available() then
          -- 	table.insert(
          -- 		result,
          -- 		{ text = "   " .. gps.get_location() .. " ", fg = my.color.my.orange, bg = my.color.my.aqua }
          -- 	)
          -- 	table.insert(result, { text = "   ", fg = my.color.my.aqua, bg = vimodeColor() })
          -- end
          if error ~= 0 then
            table.insert(result, { text = "  " .. error, fg = my.color.my.red, bold = true })
          end

          if warning ~= 0 then
            table.insert(result, { text = "  " .. warning, fg = my.color.my.orange, bold = true })
          end

          if hint ~= 0 then
            table.insert(result, { text = "  " .. hint, fg = my.color.my.green, bold = true })
          end

          if info ~= 0 then
            table.insert(result, { text = "  " .. info, fg = my.color.my.blue, bold = true })
          end

          return result
        end,
        -- right = function()
        -- end,
      },
      -- groups = {
      --   options = {
      --     toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      --   },
      --   items = {
      --     {
      --       name = "tests", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.red }, -- Optional
      --       priority = 9, -- determines where it will appear relative to other groups (Optional)
      --       -- icon = "", -- Optional
      --       matcher = function(buf) -- Mandatory
      --         return buf.filename:match('%_test')
      --             or buf.filename:match('%_spec')
      --             or vim.fn.fnamemodify(buf.path, ":.:h"):match("test")
      --             or vim.fn.fnamemodify(buf.path, ":.:h"):match("spec")
      --       end,
      --     }, {
      --       name = "plugins", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.green }, -- Optional
      --       priority = 10, -- determines where it will appear relative to other groups (Optional)
      --       -- icon = "", -- Optional
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":.:h"):match('lua.plugins')
      --       end,
      --     }, {
      --       name = "lsp", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.green }, -- Optional
      --       auto_close = true,
      --       priority = 11, -- determines where it will appear relative to other groups (Optional)
      --       -- icon = "א", -- Optional
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":.:h"):match('lua.lang')
      --       end,
      --     }, {
      --       name = "mappings", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.green }, -- Optional
      --       auto_close = true,
      --       priority = 12, -- determines where it will appear relative to other groups (Optional)
      --       -- icon = "⚔", -- Optional
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":.:h"):match('lua.keymapping')
      --       end,
      --     }, {
      --       name = "colors", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.green }, -- Optional
      --       auto_close = true,
      --       priority = 13, -- determines where it will appear relative to other groups (Optional)
      --       -- icon = "🚥", -- Optional
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":.:h"):match('lua.colorscheme')
      --       end,
      --     }, {
      --       name = "cfg", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.aqua }, -- Optional
      --       auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
      --       -- icon = "", -- Optional
      --       priority = 2,
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":.") == buf.filename
      --             or vim.fn.fnamemodify(buf.path, ":.:h"):match("config.+")
      --             or vim.fn.fnamemodify(buf.path, ":.:h"):match("cfg.+")
      --       end,
      --       -- separator = { -- Optional
      --       -- 	style = require("bufferline.groups").separator.tab,
      --       -- },
      --     },
      --     {
      --       name = "block", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.aqua }, -- Optional
      --       auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      --       -- icon = "", -- Optional
      --       priority = 3,
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":p"):match("/component.+/")
      --             or vim.fn.fnamemodify(buf.path, ":p"):match("/feature.+/")
      --       end,
      --       -- separator = { -- Optional
      --       -- 	style = require("bufferline.groups").separator.tab,
      --       -- },
      --     },
      --     {
      --       name = "view", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.aqua }, -- Optional
      --       auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      --       -- icon = "恵", -- Optional
      --       priority = 4,
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":p"):match("/page.+/")
      --             or vim.fn.fnamemodify(buf.path, ":p"):match("/view.+/")
      --       end,
      --       -- separator = { -- Optional
      --       -- 	style = require("bufferline.groups").separator.tab,
      --       -- },
      --     },
      --     {
      --       name = "store", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.aqua }, -- Optional
      --       auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
      --       -- icon = "", -- Optional
      --       priority = 5,
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":p"):match("/store.+")
      --       end,
      --       -- separator = { -- Optional
      --       -- 	style = require("bufferline.groups").separator.tab,
      --       -- },
      --     },
      --     {
      --       name = "tool", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.aqua }, -- Optional
      --       auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
      --       -- icon = "", -- Optional
      --       priority = 6,
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":p"):match("/util.+/")
      --             or vim.fn.fnamemodify(buf.path, ":p"):match("/lib.+/")
      --       end,
      --       -- separator = { -- Optional
      --       -- 	style = require("bufferline.groups").separator.tab,
      --       -- },
      --     },
      --     {
      --       name = "styles", -- Mandatory
      --       highlight = { italic = true, sp = my.color.my.aqua }, -- Optional
      --       auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
      --       icon = "☀", -- Optional
      --       priority = 7,
      --       matcher = function(buf) -- Mandatory
      --         return vim.fn.fnamemodify(buf.path, ":p"):match("/style.+/")
      --             or vim.fn.fnamemodify(buf.path, ":p"):match("/css/")
      --       end,
      --       -- separator = { -- Optional
      --       -- 	style = require("bufferline.groups").separator.tab,
      --       -- },
      --     },
      --     require("bufferline.groups").builtin.ungrouped,
      --   },
      -- },
    },
  }

  require("bufferline").setup(opts)
end

return config
