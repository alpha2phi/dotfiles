---@diagnostic disable:undefined-global
local home = os.getenv("HOME")
local path_sep = _G.is_windows and "\\" or "/"

function _G.load_variables()
	_G.is_mac = jit.os == "OSX"
	_G.is_linux = jit.os == "Linux"
	_G.is_windows = jit.os == "Windows"
	_G.vim_path = home .. path_sep .. ".config" .. path_sep .. "nvim" .. path_sep
	_G.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
	_G.modules_dir = _G.vim_path .. "modules"
	_G.python3 = _G.cache_dir .. "venv" .. path_sep .. "python" .. path_sep
	_G.node = home .. path_sep .. ".local" .. path_sep .. "bin" .. path_sep .. "neovim-node-host"
	_G.path_sep = path_sep
	_G.home = home
	_G.local_nvim = home .. path_sep .. ".local" .. path_sep .. "share" .. path_sep .. "nvim" .. path_sep
	_G.plugins = home
		.. path_sep
		.. ".local"
		.. path_sep
		.. "share"
		.. path_sep
		.. "nvim"
		.. path_sep
		.. "site"
		.. path_sep
		.. "pack"
		.. path_sep
end

--- Check if a file or directory exists in this path
function _G.exists(file)
	if file == "" or file == nil then
		return false
	end
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

--- Check if a directory exists in this path
function _G.isdir(path)
	if path == "" or path == nil then
		return false
	end
	-- "/" works on both Unix and Windows
	return _G.exists(path .. "/")
end

function _G.dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. _G.dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

function _G.readAll(file)
	local f = assert(io.open(file, "rb"))
	local content = f:read("*all")
	f:close()
	return content
end

-- check value in table
function _G.has_value(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

-- check index in table
function _G.has_key(tab, idx)
	for index, _ in pairs(tab) do
		if index == idx then
			return true
		end
	end
	return false
end

_G.load_variables()

local function preview_location_callback(_, result)
	if result == nil or vim.tbl_isempty(result) then
		return nil
	end
	vim.lsp.util.preview_location(result[1])
end

function _G.PeekDefinition()
	local params = vim.lsp.util.make_position_params()
	return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

function _G.PeekDeclaration()
	local params = vim.lsp.util.make_position_params()
	return vim.lsp.buf_request(0, "textDocument/declaration", params, preview_location_callback)
end

function _G.PeekImplementation()
	local params = vim.lsp.util.make_position_params()
	return vim.lsp.buf_request(0, "textDocument/implementation", params, preview_location_callback)
end

function _G.qftf(info)
	local items
	local ret = {}
	if info.quickfix == 1 then
		items = vim.fn.getqflist({ id = info.id, items = 0 }).items
	else
		items = vim.fn.getloclist(info.winid, { id = info.id, items = 0 }).items
	end
	local limit = 31
	local fname_fmt1, fname_fmt2 = "%-" .. limit .. "s", "…%." .. (limit - 1) .. "s"
	local valid_fmt = "%s │%5d:%-3d│%s %s"
	for i = info.start_idx, info.end_idx do
		local e = items[i]
		local fname = ""
		local str
		if e.valid == 1 then
			if e.bufnr > 0 then
				fname = fn.bufname(e.bufnr)
				if fname == "" then
					fname = "[No Name]"
				else
					fname = fname:gsub("^" .. vim.env.HOME, "~")
				end
				-- char in fname may occur more than 1 width, ignore this issue in order to keep performance
				if #fname <= limit then
					fname = fname_fmt1:format(fname)
				else
					fname = fname_fmt2:format(fname:sub(1 - limit))
				end
			end
			local lnum = e.lnum > 99999 and -1 or e.lnum
			local col = e.col > 999 and -1 or e.col
			local qtype = e.type == "" and "" or " " .. e.type:sub(1, 1):upper()
			str = valid_fmt:format(fname, lnum, col, qtype, e.text)
		else
			str = e.text
		end
		table.insert(ret, str)
	end
	return ret
end
