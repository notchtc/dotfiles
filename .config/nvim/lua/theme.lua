local set_hl = vim.api.nvim_set_hl

local colors = require "colors"

vim.cmd "colorscheme black-metal"

set_hl(0, "StatusLine", { fg = colors.base07, bg = colors.base00 })

set_hl(0, "VertSplit", { fg = colors.base0F, bg = colors.base00 })
set_hl(0, "LineNr", { link = "Normal" })
set_hl(0, "SignColumn", { link = "Normal" })

set_hl(0, "GitSignsAdd", { fg = colors.base0B, bg = colors.base00 })
set_hl(0, "GitSignsChange", { fg = colors.base04, bg = colors.base00 })
set_hl(0, "GitSignsDelete", { fg = colors.base08, bg = colors.base00 })

set_hl(0, "IndentBlanklineChar", { fg = colors.base0F, nocombine = true })
set_hl(0, "IndentBlanklineSpaceChar", { link = "IndentBlanklineChar" })
set_hl(0, "IndentBlanklineSpaceCharBlankLine", { link = "IndentBlanklineChar" })

vim.cmd [[
    syntax on
    filetype on
    filetype plugin indent on
]]
