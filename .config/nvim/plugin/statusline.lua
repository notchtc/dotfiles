local bo = vim.bo
local fn = vim.fn
local api = vim.api

local colors = require "colors"

-- Stuff used by statusline
local modes = {
    ["n"] = { "normal", colors.green },
    ["no"] = { "n-pending", colors.green },
    ["i"] = { "insert", colors.blue },
    ["ic"] = { "insert", colors.blue },
    ["t"] = { "terminal", colors.green },
    ["v"] = { "visual", colors.orange },
    ["V"] = { "v-line", colors.orange },
    [""] = { "v-block", colors.orange },
    ["R"] = { "replace", colors.cyan },
    ["Rv"] = { "v-replace", colors.cyan },
    ["s"] = { "select", colors.cyan },
    ["S"] = { "s-line", colors.cyan },
    [""] = { "s-block", colors.cyan },
    ["c"] = { "command", colors.green },
    ["cv"] = { "command", colors.green },
    ["ce"] = { "command", colors.green },
    ["r"] = { "prompt", colors.green },
    ["rm"] = { "more", colors.green },
    ["r?"] = { "confirm", colors.green },
    ["!"] = { "shell", colors.green },
}

local function mode()
    api.nvim_set_hl(0, "StatusLineMode", { bg = modes[fn.mode()][2], fg = colors.bg })

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
        "%#Normal# ",
        filepath(),
        filename(),
        "%(%M %)",
        "%(%R%)",
        "%#StatusLineBlank#",
        "%=",
        "%#Normal#",
        filetype(),
        fileencoding(),
        fileformat(),
        "%<",
        "%l:%c",
    }
end

function Statusline.inactive()
    return "%#Normal#%f %#StatusLineBlank#"
end

function Statusline.nvimtree()
    return "%#StatusLineMode# %f %#StatusLineBlank# "
end

-- Setting statusline
local id = api.nvim_create_augroup("Statusline", {})

api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = id,
    command = "setlocal statusline=%!v:lua.Statusline.active()",
})

api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = id,
    command = "setlocal statusline=%!v:lua.Statusline.inactive()",
})

api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = id,
    pattern = "NvimTree_*",
    command = "setlocal statusline=%!v:lua.Statusline.nvimtree()",
})
