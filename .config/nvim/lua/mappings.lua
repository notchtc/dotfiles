local map = vim.keymap.set
local command = vim.api.nvim_create_user_command

local M = {}

-- Set the leader key
vim.g.mapleader = " "

M.misc = function()
    -- Make navigating through splits easier
    map("", "<C-h>", "<C-w>h")
    map("", "<C-j>", "<C-w>j")
    map("", "<C-k>", "<C-w>k")
    map("", "<C-l>", "<C-w>l")

    -- Go to next/previous tab
    map("n", "<M-.>", "<CMD>bnext<CR>")
    map("n", "<M-,>", "<CMD>bprev<CR>")

    -- Close tab
    map("n", "<M-c>", "<CMD>bwipeout<CR>")

    -- Make creating splits easier
    map("", "<leader>sv", "<CMD>split<CR>")
    map("", "<leader>sh", "<CMD>vsplit<CR>")

    -- Disable search highlighting
    map("n", "<Esc>", "<CMD>noh<CR>")

    -- Packer commands till because we are not loading it at startup
    command("PackerCompile", function()
        require "pluginList"
        require("packer").compile()
    end, {})
    command("PackerInstall", function()
        require "pluginList"
        require("packer").install()
    end, {})
    command("PackerStatus", function()
        require "pluginList"
        require("packer").status()
    end, {})
    command("PackerSync", function()
        require "pluginList"
        require("packer").sync()
    end, {})
    command("PackerUpdate", function()
        require "pluginList"
        require("packer").update()
    end, {})
end

M.blankline = function()
    -- Folds
    map("", "zo", "zo<CMD>IndentBlanklineRefresh<CR>")
    map("", "za", "za<CMD>IndentBlanklineRefresh<CR>")
    map("", "zr", "zr<CMD>IndentBlanklineRefresh<CR>")
    map("", "zm", "zm<CMD>IndentBlanklineRefresh<CR>")
    map("", "zO", "zO<CMD>IndentBlanklineRefresh<CR>")
    map("", "zA", "zA<CMD>IndentBlanklineRefresh<CR>")
    map("", "zR", "zR<CMD>IndentBlanklineRefresh<CR>")
    map("", "zM", "zM<CMD>IndentBlanklineRefresh<CR>")
end

M.nvimtree = function()
    -- Toggle visibility of nvim-tree
    map("n", "<leader>n", "<CMD>NvimTreeFindFileToggle<CR>")
    -- Focus nvim-tree
    map("n", "<leader>N", "<CMD>NvimTreeFocus<CR>")
    -- Refresh nvim-tree
    map("n", "<leader>r", "<CMD>NvimTreeRefresh<CR>")
end

M.zenmode = function()
    map("n", "<leader>z", "<CMD>ZenMode<CR><CMD>IndentBlanklineRefresh<CR>")
end

return M
