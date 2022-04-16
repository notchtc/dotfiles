local g = vim.g
local cmd = vim.cmd

local colors = require "colors"

local base16 = require "base16"
base16(base16.themes.woodland, true)

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

fg_bg("StatusLine", colors.fg, colors.bg)
fg_bg("StatusLineNC", colors.fg, colors.bg)
fg_bg("GitSignsAdd", colors.green, colors.bg)
fg_bg("GitSignsChange", colors.blue, colors.bg)
fg_bg("GitSignsDelete", colors.red, colors.bg)
bg("VertSplit", colors.bg)
link("LineNr", "Normal")
link("SignColumn", "Normal")
link("IndentBlanklineChar", "NonText")
link("IndentBlanklineSpaceChar", "IndentBlanklineChar")
