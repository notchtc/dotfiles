local g = vim.g
local cmd = vim.cmd

local colors = require "colors"

vim.g.solarized_statusline = "flat"

cmd "colorscheme solarized"

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local function link(group1, group2)
    cmd("hi! link " .. group1 .. " " .. group2)
end

bg("LineNr", colors.bg)
fg_bg("GitSignsAdd", colors.green, colors.bg)
fg_bg("GitSignsChange", colors.yellow, colors.bg)
fg_bg("GitSignsDelete", colors.red, colors.bg)
cmd "hi GitSignsDelete gui=NONE cterm=NONE"
fg("NvimTreeVertSplit", colors.bg)
