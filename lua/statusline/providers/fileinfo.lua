local vim = vim
local i = require("statusline.icons")
local u = require("statusline.utils")
local diagnostic = require("statusline.providers.diagnostic")
local ugit = require("utils.git")

local M = {}

function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, "r"))
	local s = assert(f:read("*a"))
	f:close()
	if raw then
		return s
	end
	s = string.gsub(s, "^%s+", "")
	s = string.gsub(s, "%s+$", "")
	s = string.gsub(s, "[\n\r]+", " ")
	return s
end

local function file_readonly()
	if vim.bo.filetype == "help" then
		return ""
	end
	if vim.bo.readonly == true then
		return " "
	end
	return ""
end

local pybang = function()
	local b = vim.fn.getline(1)
	if b:sub(-7) == "python3" then
		return "Python 3"
	elseif b:sub(-7) == "python2" then
		return "Python 2"
	else
		return os.capture("python --version")
	end
end

local function shellbang(shell)
	local b = (function()
		if shell ~= nil then
			return shell
		elseif vim.fn.getline(1):sub(-3) == "/sh" then
			return os.capture("readlink /usr/bin/sh")
		else
			return vim.fn.getline(1)
		end
	end)()
	if b:sub(-4) == "bash" or b == "bash" then
		return "Bourne Again SHell"
	elseif b:sub(-4) == "dash" or b == "dash" then
		return "Debian Almquist SHell"
	elseif b:sub(-3) == "csh" or b:sub(-4) == "tcsh" or b == "csh" or b == "tcsh" then
		return "C SHell"
	elseif
		b:sub(-3) == "ksh"
		or b:sub(-4) == "mksh"
		or b:sub(-5) == "pdksh"
		or b == "ksh"
		or b == "mksh"
		or b == "pdksh"
	then
		return "Korn SHell"
	elseif b:sub(-3) == "zsh" or b == "zsh" then
		return "Z SHell"
	elseif b:sub(-3) == "ash" or b == "ash" then
		return "Almquist SHell"
	elseif b:sub(-3) == "ion" or b == "ion" then
		return "Ion"
	elseif b:sub(-4) == "fish" or b == "fish" then
		return "Friendly Interactive SHell"
	else
		return "Shell"
	end
end

local bangcheck = function()
	local b = vim.fn.getline(1)
	if b:sub(3) == "#!/" then
		if
			b:sub(-4) == "bash"
			or b:sub(-4) == "dash"
			or b:sub(-4) == "tcsh"
			or b:sub(-3) == "csh"
			or b:sub(-3) == "ksh"
			or b:sub(-4) == "mksh"
			or b:sub(-5) == "pdksh"
			or b:sub(-3) == "zsh"
			or b:sub(-3) == "ash"
			or b:sub(-3) == "ion"
			or b:sub(-4) == "fish"
			or b:sub(-2) == "sh"
		then
			return shellbang()
		elseif b:sub(-7) == "python3" or b:sub(-7) == "python2" or b:sub(-6) == "python" then
			return pybang()
		else
			return "FT?"
		end
	else
		return "FT?"
	end
end

-- get current file name
function M.get_current_file_name()
	local file = vim.fn.expand("%:.")
	if vim.fn.empty(file) == 1 then
		return ""
	end
	if string.len(file_readonly()) ~= 0 then
		return file .. file_readonly()
	end
	if vim.bo.modifiable then
		if vim.bo.modified then
			return file .. "   "
		end
	end
	if vim.bo.filetype == "toggleterm" then
		return "Term " .. vim.b.toggle_number
	else
		return "  " .. file .. " "
	end
end

-- format print current file size
function M.format_file_size(file)
	local size = vim.fn.getfsize(file)
	if size == 0 or size == -1 or size == -2 then
		return ""
	end
	if size < 1024 then
		size = size .. "b"
	elseif size < 1024 * 1024 then
		size = string.format("%.1f", size / 1024) .. "k"
	elseif size < 1024 * 1024 * 1024 then
		size = string.format("%.1f", size / 1024 / 1024) .. "m"
	else
		size = string.format("%.1f", size / 1024 / 1024 / 1024) .. "g"
	end
	return "  - " .. size .. " "
end

function M.get_file_size()
	local file = vim.fn.expand("%:p")
	if string.len(file) == 0 then
		return " "
	end
	return M.format_file_size(file) .. " "
end

-- get file encode
function M.get_file_encode()
	local encode = vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc
	return " " .. encode
end

-- get file format
function M.get_file_format()
	return " " .. vim.bo.fileformat
end

-- show line:column
function M.line_column()
	local line = vim.fn.line(".")
	local column = vim.fn.col(".")
	return line .. ":" .. column .. " "
end

-- show current line percent of all lines
function M.current_line_percent()
	local current_line = vim.fn.line(".")
	local total_line = vim.fn.line("$")
	if current_line == 1 then
		return " Top "
	elseif current_line == vim.fn.line("$") then
		return " Bot "
	end
	local result, _ = math.modf((current_line / total_line) * 100)
	return " " .. result .. "% "
end

local icon_colors = {
	Brown = "#905532",
	Aqua = "#3AFFDB",
	Blue = "#689FB6",
	Darkblue = "#44788E",
	Purple = "#834F79",
	Red = "#AE403F",
	Beige = "#F5C06F",
	Yellow = "#F09F17",
	Orange = "#D4843E",
	Darkorange = "#F16529",
	Pink = "#CB6F6F",
	Salmon = "#EE6E73",
	Green = "#8FAA54",
	Lightgreen = "#31B53E",
	White = "#FFFFFF",
	LightBlue = "#5fd7ff",
}

local icons = {
	Brown = { "" },
	Aqua = { "" },
	LightBlue = { "", "" },
	Blue = { "", "", "", "", "", "", "", "", "", "", "", "", "" },
	Darkblue = { "", "" },
	Purple = { "", "", "", "", "" },
	Red = { "", "", "", "", "", "" },
	Beige = { "", "", "" },
	Yellow = { "", "", "λ", "", "" },
	Orange = { "", "" },
	Darkorange = { "", "", "", "", "" },
	Pink = { "", "" },
	Salmon = { "" },
	Green = { "", "", "", "", "", "" },
	Lightgreen = { "", "", "", "﵂" },
	White = { "", "", "", "", "", "" },
}

-- filetype or extensions : { colors ,icon}
local user_icons = {}

function M.define_file_icon()
	return user_icons
end

function M.get_file_icon()
	local icon = ""
	if vim.fn.exists("*WebDevIconsGetFileTypeSymbol") == 1 then
		icon = vim.fn.WebDevIconsGetFileTypeSymbol()
		return icon .. " "
	end
	local ok, devicons = pcall(require, "nvim-web-devicons")
	if not ok then
		print("Does not found any icon plugin")
		return
	end
	local f_name, f_extension = vim.fn.expand("%:t"), vim.fn.expand("%:e")
	icon = devicons.get_icon(f_name, f_extension)
	if icon == nil then
		if user_icons[vim.bo.filetype] ~= nil then
			icon = user_icons[vim.bo.filetype][2]
		elseif user_icons[f_extension] ~= nil then
			icon = user_icons[f_extension][2]
		else
			icon = ""
		end
	end
	return icon .. " "
end

function M.get_file_icon_color()
	local icon = M.get_file_icon():match("%S+")
	local filetype = vim.bo.filetype
	local f_ext = vim.fn.expand("%:e")
	if user_icons[filetype] == nil and user_icons[f_ext] == nil then
		for k, _ in pairs(icons) do
			if vim.fn.index(icons[k], icon) ~= -1 then
				return icon_colors[k]
			end
		end
	elseif user_icons[filetype] ~= nil then
		return user_icons[filetype][1]
	elseif user_icons[f_ext] ~= nil then
		return user_icons[f_ext][1]
	end
end

function M.get_file_type()
	local ft = vim.bo.filetype
	local filetype = (function()
		if ft == "python" then
			return pybang()
		elseif ft == "sh" then
			return shellbang()
		elseif ft == "cpp" then
			return "C++"
		elseif ft == "cs" then
			return "C#"
		elseif ft == "css" then
			return "Cascading Style Sheets"
		elseif ft == "fish" then
			return "Friendly Interactive SHell"
		elseif ft == "haml" then
			return "HTML Abstraction Markup Language"
		elseif ft == "html" then
			return "HyperText Markup Langauge"
		elseif ft == "json" then
			return "JavaScript Object Notation"
		elseif ft == "less" then
			return "Leaner Style Sheets"
		elseif ft == "objc" then
			return "Objective C"
		elseif ft == "objcpp" then
			return "Objective C++"
		elseif ft == "php" then
			return "PHP Hypertext Processor"
		elseif ft == "ron" then
			return "Rusty Object Notation"
		elseif ft == "sass" then
			return "Syntastically Awesome Style Sheets"
		elseif ft == "scss" then
			return "Sassy Cascading Style Sheets"
		elseif ft == "toml" then
			return "Tom's Obvious, Minimal Language"
		elseif ft == "yaml" then
			return "Yet Another Markup Language"
		elseif ft == "zsh" then
			return "Z SHell"
		elseif ft == "toggleterm" then
			return shellbang(vim.o.shell)
		elseif ft == "" or ft == nil then
			return bangcheck()
		else
			return (ft:gsub("^%l", string.upper))
		end
	end)()
	return " " .. filetype .. " "
end

function M.filetype_seperator()
	if not diagnostic.has_diagnostics() and not ugit.check_workspace() or vim.bo.filetype == "" then
		u.GalaxyHi("FiletTypeSeperator", "act1", "purple")
		return ""
	else
		u.GalaxyHi("FiletTypeSeperator", "purple", "act1")
		return i.slant.Right
	end
end

return M
