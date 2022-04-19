local bo = vim.bo

local colors = require "colors"

local mode_colors = {
    ["n"] = { "normal", colors.green },
    ["no"] = { "n-pending", colors.green },
    ["i"] = { "insert", colors.blue },
    ["ic"] = { "insert", colors.blue },
    ["t"] = { "terminal", colors.green },
    ["v"] = { "visual", colors.yellow },
    ["V"] = { "v-line", colors.yellow },
    [""] = { "v-block", colors.yellow },
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
    vim.cmd("hi StatusLineMode guifg=" .. mode_colors[vim.fn.mode()][2])

    return mode_colors[vim.fn.mode()][1]
end

local function filepath()
    local path = vim.fn.expand "%:h"
    if path == "" or path == "." then
        return ""
    end

    return path .. "/"
end

local function filename()
    local name = vim.fn.expand "%:t"
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

Statusline = {}

Statusline.active = function()
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

vim.api.nvim_exec([[
augroup Statusline
au!
au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
au WinEnter,BufEnter,FileType NvimTree_* setlocal statusline=%!v:lua.Statusline.inactive()
augroup END
]], false)
