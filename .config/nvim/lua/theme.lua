local set_hl = vim.api.nvim_set_hl

local base16 = require "base16"
local colors = require "colors"

base16(base16.themes.woodland, true)

set_hl(0, "StatusLine", {
    ctermfg = 15,
    ctermbg = 0,
    fg = colors.fg,
    bg = colors.bg,
})
set_hl(0, "StatusLineNC", {
    ctermfg = 7,
    ctermbg = 0,
    fg = colors.fg,
    bg = colors.bg,
})

set_hl(0, "NonText", { fg = colors.gray })
set_hl(0, "VertSplit", { fg = colors.gray, bg = colors.bg })
set_hl(0, "NvimTreeVertSplit", { bg = colors.bg, fg = colors.bg })
set_hl(0, "LineNr", { link = "Normal" })
set_hl(0, "SignColumn", { link = "Normal" })

set_hl(0, "GitSignsAdd", { fg = colors.green, bg = colors.bg })
set_hl(0, "GitSignsChange", { fg = colors.blue, bg = colors.bg })
set_hl(0, "GitSignsDelete", { fg = colors.red, bg = colors.bg })

set_hl(0, "IndentBlanklineChar", { fg = colors.gray, nocombine = true })
set_hl(0, "IndentBlanklineSpaceChar", { link = "IndentBlanklineChar" })
set_hl(0, "IndentBlanklineSpaceCharBlankLine", { link = "IndentBlanklineChar" })
