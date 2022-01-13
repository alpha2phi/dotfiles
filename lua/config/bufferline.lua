---@diagnostic disable: undefined-global
vim.opt.termguicolors = true

local config = {}

function config.setup()
	local bgroups = require("bufferline.groups")
	local gps = require("nvim-gps")

	local autoload = (require("aniseed.autoload")).autoload
	local colors, groups, main, syntax, ucolors =
		autoload("katdotnvim.color"),
		autoload("katdotnvim.highlights.main"),
		autoload("katdotnvim.main"),
		autoload("katdotnvim.highlights.syntax"),
		autoload("katdotnvim.utils.color")

	function groups.fillBG()
		return "#F634B1"
	end

	function groups.selectionBG()
		return "#00C4FC"
	end

	function groups.mainFG()
		return "#F634B1"
	end

	function groups.mainBG()
		return "#333355"
	end

	function groups.highlightBG()
		return "#333355"
	end

	function groups.warningBG()
		return "#FF0000"
	end

	local function tabColor(color)
		local output = ""
		if vim.opt.background:get() == "light" then
			output = ucolors.brighten(color or groups.mainFG(), 0.5)
		else
			output = color or groups.mainFG()
		end
		return output
	end

	local function alternateColor(light, dark)
		if vim.opt.background:get() == "light" then
			return light
		end
		return dark
	end

	local highlights = {
		fill = { guifg = groups.fillBG(), guibg = groups.fillBG() },
		tab = { guifg = tabColor(), guibg = groups.highlightBG() },
		tab_selected = { guifg = tabColor(), guibg = groups.selectionBG() },
		tab_close = { guifg = tabColor(), guibg = groups.fillBG(), gui = "bold,italic" },
		info = { guifg = tabColor(), guibg = groups.selectionBG() },
		buffer_visible = {
			guifg = tabColor(),
			guibg = groups.mainBG(),
		},
		buffer_selected = { guifg = tabColor(), guibg = groups.selectionBG(), gui = "bold,italic" },
		diagnostic = {
			guifg = tabColor(),
			guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
		},
		diagnostic_visible = {
			guifg = tabColor(),
			guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
		},
		diagnostic_selected = { guifg = tabColor(), guibg = groups.selectionBG(), gui = "bold,italic" },
		close_button = { guifg = tabColor(), guibg = groups.highlightBG(), gui = "bold" },
		close_button_visible = {
			guifg = tabColor(),
			guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
			gui = "bold",
		},
		close_button_selected = { guifg = tabColor(), guibg = groups.selectionBG(), gui = "bold" },
		modified = { guifg = groups.warningBG(), guibg = groups.highlightBG() },
		modified_visible = {
			guifg = groups.warningBG(),
			guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
		},
		modified_selected = { guifg = groups.warningBG(), guibg = groups.selectionBG() },
		duplicate_selected = { guifg = tabColor(), guibg = groups.selectionBG() },
		duplicate_visible = {
			guifg = tabColor(),
			guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
		},
		duplicate = { guifg = tabColor(), guibg = groups.highlightBG() },
		separator_selected = { guifg = groups.fillBG(), guibg = groups.selectionBG() },
		separator_visible = {
			guifg = groups.fillBG(),
			guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8),
		},
		separator = { guifg = groups.fillBG(), guibg = groups.highlightBG() },
		indicator_selected = { guifg = tabColor(), guibg = groups.selectionBG() },
		pick = { guifg = "#FFFFFF", guibg = groups.mainBG() },
		background = { guifg = "#FFFFFF", guibg = groups.mainBG() },
	}

	local opts = {
		highlights = highlights,
		options = {
			numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both",
			close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
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
				if buf.name:match("%.txt") then
					return vim.fn.fnamemodify(buf.name, ":t:r")
				end
			end,
			max_name_length = 21,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			tab_size = 7,
			diagnostics = "nvim_lsp", -- false | "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " " or (e == "warning" and " " or " ")
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
					local result = {}

					if gps.is_available() then
						table.insert(result, { text = gps.get_location() .. " ", guifg = "magenta", guibg = "black" })
						table.insert(result, { text = "   ", guifg = "black", guibg = "#F634B1" })
					end

					return result
				end,
				right = function()
					local result = {}
					local error = vim.diagnostic.get(0, { severity = [[Error]] }).get_count
					local warning = vim.diagnostic.get(0, { severity = [[Warning]] }).get_count
					local info = vim.diagnostic.get(0, { severity = [[Information]] }).get_count
					local hint = vim.diagnostic.get(0, { severity = [[Hint]] }).get_zRunt

					if error ~= 0 then
						table.insert(result, { text = "  " .. error, guifg = "#EC5241" })
					end

					if warning ~= 0 then
						table.insert(result, { text = "  " .. warning, guifg = "#EFB839" })
					end

					if hint ~= 0 then
						table.insert(result, { text = "  " .. hint, guifg = "#A3BA5E" })
					end

					if info ~= 0 then
						table.insert(result, { text = "  " .. info, guifg = "#7EA9A7" })
					end
					return result
				end,
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
