local g = vim.g

-- Enable git highlight
g.nvim_tree_git_hl = 1

-- Change symlink arrow
g.nvim_tree_symlink_arrow = " → "

-- Show git, folder and file icons
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}

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
        indent_markers = {
            enable = true,
            icons = {
                corner = "╰ ",
            }
        },
    },
    hijack_directories = {
        enable = false,
        auto_open = false,
    },
}
