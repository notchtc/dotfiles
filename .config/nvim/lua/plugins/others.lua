local M = {}

local g = vim.g

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if not present then
        return
    end

    colorizer.setup({
      '*';
      '!packer';
      '!NvimTree';
    }, { rgb_fn = true; })
    COLORIZER_SETUP_HOOK()
end

M.blankline = function()
    local present, blankline = pcall(require, "indent_blankline")
    if not present then
        return
    end

    blankline.setup {
        enabled = true,
        char_list = { "│", "╎", "┆", "┊", "╵" },
        filetype_exclude = { "txt", "packer", "help", "NvimTree" },
        buftype_exclude = { "terminal" },
        show_first_indent_level = false,
        show_foldtext = true,
    }
end

return M
