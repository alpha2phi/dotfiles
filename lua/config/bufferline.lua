---@diagnostic disable: undefined-global
vim.opt.termguicolors = true

local config = {}

function config.setup()
  -- local gps = require("nvim-gps")

  local function vimodeColor()
    return my.color.my.vimode[vim.fn.mode()]
  end

  local function secondaryVimodeColor()
    return my.color.fn.background_blend(vimodeColor(), 50)
  end

  local function tertiaryVimodeColor()
    return my.color.fn.background_blend(vimodeColor(), 21)
  end

  local highlights = {
    background = { guibg = tertiaryVimodeColor() },
    -- tab = { guibg = vimodeColor() },
    -- tab_selected = { guifg = vimodeColor(), guibg = groups.selectionBG() },
    -- tab_close = { guifg = vimodeColor(), guibg = groups.fillBG(), gui = "bold,italic" },
    -- info = { guifg = vimodeColor(), guibg = groups.selectionBG() },
    fill = { guibg = my.color.my.dark },
    buffer = { guifg = my.color.my.light, guibg = secondaryVimodeColor() },
    buffer_visible = { guifg = my.color.my.light, guibg = secondaryVimodeColor() },
    buffer_selected = { guifg = my.color.my.light, guibg = vimodeColor(), gui = "bold" },
    tab_selected = { guifg = my.color.my.light, guibg = vimodeColor(), gui = "bold" },
    diagnostic = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    -- diagnostic_visible = {
    -- 	guifg = vimodeColor(),
    -- 	guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    -- },
    -- diagnostic = { guifg = my.color.my.red, gui = "bold" },
    diagnostic_visible = { guifg = my.color.my.dark, guibg = secondaryVimodeColor(), gui = "bold" },
    diagnostic_selected = { guifg = my.color.my.dark, guibg = vimodeColor(), gui = "bold,italic" },
    info = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    info_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
    },
    info_selected = {
      guifg = my.color.my.dark,
      guibg = vimodeColor()
    },
    hint = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    hint_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
    },
    hint_selected = {
      guifg = my.color.my.dark,
      guibg = vimodeColor()
    },
    warning = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    warning_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
    },
    warning_selected = {
      guifg = my.color.my.dark,
      guibg = vimodeColor()
    },
    error = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    error_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
    },
    error_selected = {
      guifg = my.color.my.dark,
      guibg = vimodeColor()
    },
    info_diagnostic = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    info_diagnostic_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
    },
    info_diagnostic_selected = {
      guifg = my.color.my.dark,
      guibg = vimodeColor()
    },
    hint_diagnostic = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    hint_diagnostic_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
    },
    hint_diagnostic_selected = {
      guifg = my.color.my.dark,
      guibg = vimodeColor()
    },
    warning_diagnostic = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    warning_diagnostic_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
    },
    warning_diagnostic_selected = {
      guifg = my.color.my.dark,
      guibg = vimodeColor()
    },
    error_diagnostic = {
      guifg = my.color.my.dark,
      guibg = tertiaryVimodeColor()
    },
    error_diagnostic_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
    },
    error_diagnostic_selected = {
      guifg = my.color.my.dark,
      guibg = vimodeColor()
    },
    -- hint_selected = { guifg = my.color.my.orange, guibg = my.color.my.aqua, gui = "bold,italic" },
    -- warning_selected = { guifg = my.color.my.red, guibg = my.color.my.aqua, gui = "bold,italic" },
    -- error_visible = { guifg = "#550000", guibg = "#F634B1", gui = "bold,italic" },
    -- error_selected = { guifg = my.color.my.red, guibg = my.color.my.aqua, gui = "bold,italic" },
    -- warning = { guifg = my.color.my.red, gui = "bold,italic" },
    -- error = { guifg = my.color.my.red, gui = "bold,italic" },
    -- hint_diagnostic_selected = { guifg = my.color.my.green, guibg = my.color.my.aqua, gui = "bold,italic" },
    -- info_diagnostic_selected = { guifg = my.color.my.green, guibg = my.color.my.aqua, gui = "bold,italic" },
    -- warning_diagnostic_selected = { guifg = my.color.my.orange, guibg = my.color.my.aqua, gui = "bold,italic" },
    -- error_diagnostic_selected = { guifg = my.color.my.red, guibg = my.color.my.aqua, gui = "bold,italic" },
    close_button = { guifg = my.color.my.light, guibg = tertiaryVimodeColor() },
    -- close_button_visible = {
    -- 	guifg = vimodeColor(),
    -- 	guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    -- 	gui = "bold",
    -- },
    close_button_visible = { guifg = my.color.my.light, guibg = secondaryVimodeColor(), gui = "bold" },
    close_button_selected = { guifg = my.color.my.light, guibg = vimodeColor(), gui = "bold" },
    -- modified = { guibg = "#F53737" },
    -- modified_visible = {
    -- 	guifg = groups.warningBG(),
    -- 	guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    -- },
    -- modified_selected = { guifg = my.color.my.light, guibg = my.color.my.aqua },
    -- duplicate_selected = { guifg = my.color.my.light, guibg = my.color.my.aqua },
    -- duplicate_visible = {
    -- 	guifg = vimodeColor(),
    -- 	guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    -- },
    -- duplicate = { guifg = vimodeColor(), guibg = groups.highlightBG() },
    separator = { guifg = my.color.my.dark, guibg = tertiaryVimodeColor() },
    separator_selected = { guifg = my.color.my.dark, guibg = vimodeColor() },
    separator_visible = {
      guifg = my.color.my.dark,
      guibg = secondaryVimodeColor()
      -- 	guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
    },
    -- indicator_selected = { guifg = vimodeColor(), guibg = my.color.my.aqua },
    -- pick_selected = { guifg = vimodeColor(), guibg = my.color.my.aqua },
    -- background = { guifg = "#FFFFFF", guibg = groups.mainBG() },
  }

  local opts = {
    highlights = highlights,
    options = {
      numbers = "buffer_id", -- "none" | "ordinal" | "buffer_id" | "both",
      close_command = "bp | bd! %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "sbuffer %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      middle_mouse_command = "sbuffer %d", -- can be a string | function, see "Mouse actions"
      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      indicator_icon = "▎",
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
      show_buffer_icons = true, --true | false, -- disable filetype icons for buffers
      show_buffer_close_icons = true, --true | false,
      show_close_icon = true, --true | false,
      show_tab_indicators = true, --true | false,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "slant", -- "slant"| "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false, --| true,
      always_show_bufferline = true, --| false,
      sort_by = function(buffer_a, buffer_b)
        local mod_a = ((vim.loop.fs_stat(buffer_a.path) or {}).mtime or {}).sec or 0
        local mod_b = ((vim.loop.fs_stat(buffer_b.path) or {}).mtime or {}).sec or 0
        return mod_a > mod_b
      end,
      --'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' |
      custom_areas = {
        left = function()
          -- local result = {}

          -- 	if gps.is_available() then
          -- 		table.insert(result, { text = gps.get_location() .. " ", guifg = my.color.my.orange, guibg = "black" })
          -- 		table.insert(result, { text = "   ", guifg = "black", guibg = vimodeColor() })
          -- 	end

          -- 	return result
          local result = {}
          local seve = vim.diagnostic.severity
          local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
          local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
          local info = #vim.diagnostic.get(0, { severity = seve.INFO })
          local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
          -- if gps.is_available() then
          -- 	table.insert(
          -- 		result,
          -- 		{ text = "   " .. gps.get_location() .. " ", guifg = my.color.my.orange, guibg = my.color.my.aqua }
          -- 	)
          -- 	table.insert(result, { text = "   ", guifg = my.color.my.aqua, guibg = vimodeColor() })
          -- end
          if error ~= 0 then
            table.insert(result, { text = "  " .. error, guifg = my.color.my.red, guisp = "bold" })
          end

          if warning ~= 0 then
            table.insert(result, { text = "  " .. warning, guifg = my.color.my.orange, guisp = "bold" })
          end

          if hint ~= 0 then
            table.insert(result, { text = "  " .. hint, guifg = my.color.my.green, guisp = "bold" })
          end

          if info ~= 0 then
            table.insert(result, { text = "  " .. info, guifg = my.color.my.blue, guisp = "bold" })
          end

          return result
        end,
        -- right = function()
        -- end,
      },
      -- groups = {
      -- 	options = {
      -- 		toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      -- 	},
      -- 	items = {
      -- 		{
      -- 			name = "cfg", -- Mandatory
      -- 			highlight = { gui = "italic", guisp = "gold" }, -- Optional
      -- 			auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      -- 			icon = "", -- Optional
      -- 			matcher = function(buf) -- Mandatory
      -- 				return vim.fn.fnamemodify(buf.path, ":.") == buf.filename
      -- 					or vim.fn.fnamemodify(buf.path, ":.:h"):match("config")
      -- 			end,
      -- 			-- separator = { -- Optional
      -- 			-- 	style = require("bufferline.groups").separator.tab,
      -- 			-- },
      -- 		},
      -- 		{
      -- 			name = "block", -- Mandatory
      -- 			highlight = { gui = "italic", guisp = "gold" }, -- Optional
      -- 			auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      -- 			icon = "", -- Optional
      -- 			matcher = function(buf) -- Mandatory
      -- 				return vim.fn.fnamemodify(buf.path, ":p"):match("/component.*/")
      -- 			end,
      -- 			-- separator = { -- Optional
      -- 			-- 	style = require("bufferline.groups").separator.tab,
      -- 			-- },
      -- 		},
      -- 		{
      -- 			name = "view", -- Mandatory
      -- 			highlight = { gui = "italic", guisp = "gold" }, -- Optional
      -- 			auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      -- 			icon = "恵", -- Optional
      -- 			matcher = function(buf) -- Mandatory
      -- 				return vim.fn.fnamemodify(buf.path, ":p"):match("/page.*/")
      -- 					or vim.fn.fnamemodify(buf.path, ":p"):match("/view.*/")
      -- 			end,
      -- 			-- separator = { -- Optional
      -- 			-- 	style = require("bufferline.groups").separator.tab,
      -- 			-- },
      -- 		},
      -- 		{
      -- 			name = "store", -- Mandatory
      -- 			highlight = { gui = "italic", guisp = "gold" }, -- Optional
      -- 			auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      -- 			icon = "", -- Optional
      -- 			matcher = function(buf) -- Mandatory
      -- 				return vim.fn.fnamemodify(buf.path, ":p"):match("/store/")
      -- 			end,
      -- 			-- separator = { -- Optional
      -- 			-- 	style = require("bufferline.groups").separator.tab,
      -- 			-- },
      -- 		},
      -- 		{
      -- 			name = "tool", -- Mandatory
      -- 			highlight = { gui = "italic", guisp = "gold" }, -- Optional
      -- 			auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
      -- 			icon = "", -- Optional
      -- 			matcher = function(buf) -- Mandatory
      -- 				return vim.fn.fnamemodify(buf.path, ":p"):match("/util.*/")
      -- 					or vim.fn.fnamemodify(buf.path, ":p"):match("/lib.*/")
      -- 			end,
      -- 			-- separator = { -- Optional
      -- 			-- 	style = require("bufferline.groups").separator.tab,
      -- 			-- },
      -- 		},
      -- 		{
      -- 			name = "def", -- Mandatory
      -- 			highlight = { gui = "italic", guisp = "gold" }, -- Optional
      -- 			auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
      -- 			icon = "", -- Optional
      -- 			matcher = function(buf) -- Mandatory
      -- 				return vim.fn.fnamemodify(buf.path, ":p"):match("/style.*/")
      -- 					or vim.fn.fnamemodify(buf.path, ":p"):match("/settings/")
      -- 			end,
      -- 			-- separator = { -- Optional
      -- 			-- 	style = require("bufferline.groups").separator.tab,
      -- 			-- },
      -- 		},
      -- 		bgroups.builtin.ungrouped,
      -- 	},
      -- },
    },
  }

  require("bufferline").setup(opts)
end

return config
