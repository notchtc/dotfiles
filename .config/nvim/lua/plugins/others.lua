local M = {}

local g = vim.g

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup({}, { css = true })
        vim.cmd "ColorizerReloadAllBuffers"
    end
end

M.blankline = function()
    require("indent_blankline").setup {
        enabled = true,
        char_list = { "│", "╎", "┆", "┊", "╵" },
        filetype_exclude = { "txt", "packer", "help", "NvimTree" },
        buftype_exclude = { "terminal" },
        show_first_indent_level = false,
        show_foldtext = true,
    }
end

return M
