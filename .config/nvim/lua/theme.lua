local g = vim.g
local cmd = vim.cmd

local colors = require "colors"

g.tokyonight_style = "night"
g.tokyonight_dark_sidebar = false

cmd "colorscheme tokyonight"

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

fg("NvimTreeVertSplit", colors.bg)
fg("IndentBlanklineChar", "#3b4261")
link("IndentBlanklineSpaceChar", "SpecialKey")
link("IndentBlanklineSpaceCharBlankline", "SpecialKey")
