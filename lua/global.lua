local G = {}
local home = os.getenv("HOME")
local path_sep = G.is_windows and "\\" or "/"

function G.load_variables()
	G.is_mac = jit.os == "OSX"
	G.is_linux = jit.os == "Linux"
	G.is_windows = jit.os == "Windows"
	G.vim_path = home .. path_sep .. ".config" .. path_sep .. "nvim" .. path_sep
	G.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
	G.modules_dir = G.vim_path .. "modules"
	G.python3 = G.cache_dir .. "venv" .. path_sep .. "python" .. path_sep
	G.node = home .. path_sep .. ".local" .. path_sep .. "bin" .. path_sep .. "neovim-node-host"
	G.path_sep = path_sep
	G.home = home
	G.local_nvim = home .. path_sep .. ".local" .. path_sep .. "share" .. path_sep .. "nvim" .. path_sep
	G.plugins = home
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
function G.exists(file)
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
function G.isdir(path)
	if path == "" or path == nil then
		return false
	end
	-- "/" works on both Unix and Windows
	return G.exists(path .. "/")
end

function G.dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. G.dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

function G.readAll(file)
	local f = assert(io.open(file, "rb"))
	local content = f:read("*all")
	f:close()
	return content
end

-- check value in table
function G.has_value(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

-- check index in table
function G.has_key(tab, idx)
	for index, _ in pairs(tab) do
		if index == idx then
			return true
		end
	end
	return false
end

G.load_variables()

-- better looks for qf-windows
function G.qftf(info)
	local items
	local ret = {}
	if info.quickfix == 1 then
		items = fn.getqflist({ id = info.id, items = 0 }).items
	else
		items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
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

return G
