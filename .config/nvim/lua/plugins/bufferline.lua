local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

local colors = require "colors"
bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "NvimTree", padding = 1 } },
        numbers = "none",
        separator_style = "thin",
        always_show_bufferline = false,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        modified_icon = "*",
        left_trunc_marker = "<-",
        right_trunc_marker = "->",
    },
    highlights = {
        fill = {
            guibg = colors.bg,
        },
        background = {
            guibg = colors.bg,
        },
        tab = {
            guifg = colors.fg,
            guibg = colors.bg,
        },
        tab_selected = {
            guifg = colors.blue,
            guibg = colors.bg2,
        },
        tab_close = {
            guifg = colors.blue,
            guibg = colors.bg2,
        },
        buffer_visible = {
            guifg = colors.fg,
            guibg = colors.bg,
        },
        buffer_selected = {
            guifg = colors.fg,
            guibg = colors.bg2,
            gui = "bold",
        },
        modified = {
            guifg = colors.red,
            guibg = colors.bg,
        },
        modified_visible = {
            guifg = colors.blue,
            guibg = colors.bg,
        },
        modified_selected = {
            guifg = colors.green,
            guibg = colors.bg2,
        },
        duplicate = {
            guibg = colors.bg,
        },
        duplicate_selected = {
            guibg = colors.bg2,
        },
        separator = {
            guifg = colors.bg,
            guibg = colors.bg,
        },
        indicator_visible = {
            guibg = colors.bg,
        },
        indicator_selected = {
            guibg = colors.bg2,
        },
    },
}
