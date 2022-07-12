local bo = vim.bo
local fn = vim.fn
local api = vim.api

local colors = require "colors"

-- Stuff used by statusline
local modes = {
    ["n"] = { "normal", colors.base0F },
    ["no"] = { "n-pending", colors.base0F },
    ["i"] = { "insert", colors.base08 },
    ["ic"] = { "insert", colors.base08 },
    ["t"] = { "terminal", colors.base0F },
    ["v"] = { "visual", colors.base0B },
    ["V"] = { "v-line", colors.base0B },
    [""] = { "v-block", colors.base0B },
    ["R"] = { "replace", colors.base08 },
    ["Rv"] = { "v-replace", colors.base08 },
    ["s"] = { "select", colors.base08 },
    ["S"] = { "s-line", colors.base08 },
    [""] = { "s-block", colors.base08 },
    ["c"] = { "command", colors.base0F },
    ["cv"] = { "command", colors.base0F },
    ["ce"] = { "command", colors.base0F },
    ["r"] = { "prompt", colors.base0F },
    ["rm"] = { "more", colors.base0F },
    ["r?"] = { "confirm", colors.base0F },
    ["!"] = { "shell", colors.base0f },
}

local function mode()
    api.nvim_set_hl(0, "StatusLineMode", { bg = modes[fn.mode()][2], fg = colors.base00 })

    return " " .. modes[fn.mode()][1] .. " "
end

local function filepath()
    local path = fn.pathshorten(fn.expand "%:h")
    if path == "" or path == "." then
        return ""
    end

    return path .. "/"
end

local function filename()
    local name = fn.expand "%:t"
    if name == "" then
        return ""
    end

    return name .. " "
end

local function filetype()
    local type = bo.filetype

    if type == "" then
        return ""
    else
        return type .. " "
    end
end

local function fileencoding()
    local encoding = bo.fileencoding

    if encoding == "utf-8" or encoding == "" then
        return ""
    else
        return encoding .. " "
    end
end

local function fileformat()
    local format = bo.fileformat

    if format == "unix" or format == "" then
        return ""
    else
        return format .. " "
    end
end

-- Create statusline
Statusline = {}

function Statusline.active()
    return table.concat {
        "%#StatusLineMode#",
        mode(),
        "%<",
        "%#StatusLine# ",
        filepath(),
        filename(),
        "%(%M %)",
        "%(%R%)",
        "%=",
        filetype(),
        fileencoding(),
        fileformat(),
        "%<",
        "%l:%c",
    }
end

function Statusline.inactive()
    return "%f "
end

-- Setting statusline
local id = api.nvim_create_augroup("Statusline", {})

api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = id,
    command = "setlocal laststatus=3 | setlocal statusline=%!v:lua.Statusline.active()",
})

api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = id,
    command = "setlocal laststatus=3 | setlocal statusline=%!v:lua.Statusline.inactive()",
})

api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = id,
    pattern = "NvimTree_*",
    command = "setlocal laststatus=0",
})
