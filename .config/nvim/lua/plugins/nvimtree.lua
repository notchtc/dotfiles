local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end

nvimtree.setup {
    -- Disable netrw
    disable_netrw = true,
    -- Prevent netrw from automatically opening when opening directories
    hijack_netrw = true,
    view = {
        side = "left",
        width = 25,
    },
    renderer = {
        highlight_git = true,
        indent_markers = {
            enable = true,
            icons = {
                corner = "╰ ",
            },
        },
        icons = {
            symlink_arrow = " → ",
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
        },
    },
}
