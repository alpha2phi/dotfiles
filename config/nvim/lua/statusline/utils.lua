local vim = vim
local c = require("statusline.colors")

local M = {}

function M.GalaxyFG(item, col)
    vim.api.nvim_command("hi Galaxy" .. item .. " guifg=" .. c.Color(col)())
end
function M.GalaxyBG(item, col)
    vim.api.nvim_command("hi Galaxy" .. item .. " guibg=" .. c.Color(col)())
end
function M.GalaxyHi(item, colorfg, colorbg)
    vim.api.nvim_command(
        "hi Galaxy" .. item .. " guifg=" .. c.Color(colorfg)() .. " guibg=" .. c.Color(colorbg)()
    )
end

function M.GalaxyHiB(item, colorfg, colorbg)
    vim.api.nvim_command(
        "hi Galaxy" .. item .. " guifg=" .. c.Color(colorfg)() .. " guibg=" .. c.Color(colorbg)() .. " gui=bold"
    )
end

function M.space()
    return " "
end

function M.buffer_not_empty()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

function M.checkwidth()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

return M
