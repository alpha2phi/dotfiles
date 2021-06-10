local d2d = require("Dusk-til-Dawn")

M = {}

M.dark = {
    bg = "#282c34",
    bg2 = "#212026",
    base = "#b2b2b2",
    comp = "#c56ec3",
    func = "#bc6ec5",
    act1 = "#222226",
    DarkGoldenrod2 = "#eead0e", -- normal / unmodified
    chartreuse3 = "#66cd00", --insert
    SkyBlue2 = "#7ec0ee", -- modified
    chocolate = "#d2691e", -- replace
    gray = "#bebebe", -- visual
    plum3 = "#cd96cd", -- read-only / motion
    yellow = "#fabd2f",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#afd700",
    orange = "#FF8800",
    purple = "#5d4d7a", --act2
    magenta = "#d16d9e",
    grey = "#c0c0c0",
    blue = "#0087d7",
    red = "#ec5f67",
    comments = "#2aa1ae",
    head1 = "#4f97d7",
    error = "#FC5C94",
    warning = "#F3EA98",
    info = "#8DE6F7"
}


M.light = {
    bg = "#fbf8ef",
    bg2 = "#efeae9",
    base = "#655370",
    comp = "#6c4173",
    act1 = "#e7e5eb",
    func = "#6c3163",
    DarkGoldenrod2 = "#eead0e", -- normal / unmodified
    chartreuse3 = "#66cd00", --insert
    SkyBlue2 = "#7ec0ee", -- modified
    chocolate = "#d2691e", -- replace
    gray = "#bebebe", -- visual
    plum3 = "#cd96cd", -- read-only / motion
    yellow = "#fabd2f",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#afd700",
    orange = "#FF8800",
    purple = "#d3d3e7", --act2
    magenta = "#d16d9e",
    grey = "#c0c0c0",
    blue = "#0087d7",
    red = "#ec5f67",
    comments = "#2aa1ae",
    head1 = "#3a81c3",
    error = "#FC5C94",
    warning = "#F3EA98",
    info = "#8DE6F7"
}

function M.color(val)
    local now = d2d.currentTime()
    local sunrise = (function()
        if vim.g["dusk_til_dawn_sway_colord"] ~= true then
            return vim.g["dusk_til_dawn_morning"] * 3600
        else
            return d2d.readSwayColordDawn()
        end
    end)()
    local sunset = (function()
        if vim.g["dusk_til_dawn_sway_colord"] ~= true then
            return vim.g["dusk_til_dawn_night"] * 3600
        else
            return d2d.readSwayColordDusk()
        end
    end)()

    if now < sunrise or now > sunset then
        return M.dark[val]
    else
        return M.light[val]
    end
end

function M.Color(val)
      return function()
        local dark = {
            bg = "#282c34",
            bg2 = "#212026",
            base = "#b2b2b2",
            comp = "#c56ec3",
            func = "#bc6ec5",
            act1 = "#222226",
            DarkGoldenrod2 = "#eead0e", -- normal / unmodified
            chartreuse3 = "#66cd00", --insert
            SkyBlue2 = "#7ec0ee", -- modified
            chocolate = "#d2691e", -- replace
            gray = "#bebebe", -- visual
            plum3 = "#cd96cd", -- read-only / motion
            yellow = "#fabd2f",
            cyan = "#008080",
            darkblue = "#081633",
            green = "#afd700",
            orange = "#FF8800",
            purple = "#5d4d7a", --act2
            magenta = "#d16d9e",
            grey = "#c0c0c0",
            blue = "#0087d7",
            red = "#ec5f67",
            comments = "#2aa1ae",
            head1 = "#4f97d7",
            error = "#e0211d", --err
            warning = "#dc752f", -- war
            info = "#4f97d7" -- keyword
        }
        local light = {
            bg = "#fbf8ef",
            bg2 = "#efeae9",
            base = "#655370",
            comp = "#6c4173",
            act1 = "#e7e5eb",
            func = "#6c3163",
            DarkGoldenrod2 = "#eead0e", -- normal / unmodified
            chartreuse3 = "#66cd00", --insert
            SkyBlue2 = "#7ec0ee", -- modified
            chocolate = "#d2691e", -- replace
            gray = "#bebebe", -- visual
            plum3 = "#cd96cd", -- read-only / motion
            yellow = "#fabd2f",
            cyan = "#008080",
            darkblue = "#081633",
            green = "#afd700",
            orange = "#FF8800",
            purple = "#d3d3e7", --act2
            magenta = "#d16d9e",
            grey = "#c0c0c0",
            blue = "#0087d7",
            red = "#ec5f67",
            comments = "#2aa1ae",
            head1 = "#3a81c3",
            error = "#e0211d", -- err
            warning = "#dc752f", -- war
            info = "#3a81c3"
        }
        if vim.o.background ~= nil and vim.o.background == "light" then
            if light[val] ~= nil then
                return light[val]
            else
                return light.error
            end
        elseif vim.o.background ~= nil and vim.o.background == "dark" then
            if dark[val] ~= nil then
                return dark[val]
            else
                return dark.error
            end
        end
    end
end

return M
