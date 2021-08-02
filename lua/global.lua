local G = {}
local home = os.getenv("HOME")
local path_sep = G.is_windows and '\\' or '/'

function G.load_variables()
    G.is_mac = jit.os == 'OSX'
    G.is_linux = jit.os == 'Linux'
    G.is_windows = jit.os == 'Windows'
    G.vim_path = home .. path_sep .. '.config' .. path_sep .. 'nvim' .. path_sep
    G.cache_dir = home .. path_sep .. '.cache' .. path_sep .. 'nvim' .. path_sep
    G.modules_dir = G.vim_path .. 'modules'
    G.python3 = G.cache_dir .. 'venv' .. path_sep .. 'python' .. path_sep
    G.node = home .. path_sep .. ".local" .. path_sep .. "bin" .. path_sep .. "neovim-node-host"
    G.path_sep = path_sep
    G.home = home
    G.local_nvim = home .. path_sep .. '.local' .. path_sep .. 'share' .. path_sep .. 'nvim' .. path_sep
    G.plugins = home .. path_sep .. '.local' .. path_sep .. 'share' .. path_sep .. 'nvim' .. path_sep .. 'site' .. path_sep .. 'pack' .. path_sep
end

--- Check if a file or directory exists in this path
function G.exists(file)
    if file == '' or file == nil then return false end
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
    if path == '' or path == nil then return false end
    -- "/" works on both Unix and Windows
    return G.exists(path .. "/")
end

function G.dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. G.dump(v) .. ','
        end
        return s .. '} '
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

return G
