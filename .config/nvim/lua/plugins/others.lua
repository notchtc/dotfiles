local M = {}

local g = vim.g

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if not present then
        return
    end

    colorizer.setup({
        "*",
        "!packer",
        "!NvimTree",
    }, { rgb_fn = true })
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
        char_blankline = " ",
        filetype_exclude = { "txt", "packer", "help", "NvimTree" },
        buftype_exclude = { "terminal" },
        show_first_indent_level = false,
        show_foldtext = true,
        use_treesitter = true,
    }
end

M.asciidoctor = function()
    g.asciidoctor_syntax_conceal = 1
end

M.null_ls = function()
    local present, null_ls = pcall(require, "null-ls")
    if not present then
        return
    end

    null_ls.setup {
        sources = {
            null_ls.builtins.diagnostics.vale,
        },
    }
end

return M
