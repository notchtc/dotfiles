local openPop = assert(io.popen('xrdb -query'))
local xrdb = openPop:read('*all')
openPop:close()

if not xrdb or xrdb == '' then
    return {
        color_window_background = "#231e18",
        color_background = "#231e18",
        color_foreground = "#cabcb1",
        color_bold = "#cabcb1",
        color_cursor = "#cabcb1",
        color_cursor_foreground = "#231e18",
        color_highlight = "#cabcb1",
        color_highlight_foreground = "#231e18",
        color_0 = "#231e18",
        color_1 = "#d35c5c",
        color_2 = "#b7ba53",
        color_3 = "#e0ac16",
        color_4 = "#88a4d3",
        color_5 = "#bb90e2",
        color_6 = "#6eb958",
        color_7 = "#cabcb1",
        color_8 = "#9d8b70",
        color_9 = "#ca7f32",
        color_10 = "#302b25",
        color_11 = "#48413a",
        color_12 = "#b4a490",
        color_13 = "#d7c8bc",
        color_14 = "#b49368",
        color_15 = "#e4d4c8",
    }
end

local bg_line = string.sub(xrdb, string.find(xrdb, "*.background:%c#%x%x%x%x%x%x"))
local bg = string.gsub(bg_line, ".*#", "#")

local fg_line = string.sub(xrdb, string.find(xrdb, "*.foreground:%c#%x%x%x%x%x%x"))
local fg = string.gsub(fg_line, ".*#", "#")

local theme = {
    color_window_background = bg,
    color_background = bg,
    color_foreground = fg,
    color_bold = fg,
    color_cursor = fg,
    color_cursor_foreground = bg,
    color_highlight = fg,
    color_highlight_foreground = bg,
}

for i = 0, 15 do
    local color = string.sub(xrdb, string.find(xrdb, "*.color" .. i .. ":%c#%x%x%x%x%x%x"))
    theme["color_" .. i] = string.gsub(color, ".*#", "#")
end

return theme
