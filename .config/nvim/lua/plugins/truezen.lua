local present, true_zen = pcall(require, "true-zen")
if not present then
    return
end

local colors = require "colors"

true_zen.setup {
    modes = {
        ataraxis = {
            affected_higroups = {
                NonText = false,
            },
        },
    },
    integrations = {
        gitsigns = true,
        nvim_bufferline = true,
        twilight = true,
    },
    misc = {
        cursor_by_mode = true,
    },
}

true_zen.after_mode_ataraxis_off = function()
    vim.cmd("hi StatusLine gui=reverse guifg=" .. colors.bg .. " guibg=" .. colors.fg2)
    vim.cmd("hi StatusLineNC gui=reverse guifg=" .. colors.bg .. " guibg=" .. colors.fg2)
end
