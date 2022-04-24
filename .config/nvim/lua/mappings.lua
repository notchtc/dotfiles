local map = vim.keymap.set
local command = vim.api.nvim_create_user_command

local M = {}

-- Set the leader key
vim.g.mapleader = " "

M.misc = function()
    -- Disable arrow keys for moving in normal mode
    map("", "<up>", "")
    map("", "<down>", "")
    map("", "<left>", "")
    map("", "<right>", "")

    -- Make navigating through splits easier
    map("", "<C-h>", "<C-w>h")
    map("", "<C-j>", "<C-w>j")
    map("", "<C-k>", "<C-w>k")
    map("", "<C-l>", "<C-w>l")

    -- Make creating splits easier
    map("", "<leader>sv", "<CMD>split<CR>")
    map("", "<leader>sh", "<CMD>vsplit<CR>")

    -- Go through wrapped lines
    map("", "j", "gj")
    map("", "k", "gk")

    -- Spell Check
    map("n", "<leader>sp", "<CMD>setlocal spell! spelllang=en_us<CR>")

    -- Disable search highlighting
    map("n", "<Esc>", "<CMD>noh<CR>")

    -- Folds
    map("", "zo", "zo<CMD>IndentBlanklineRefresh<CR>")
    map("", "za", "za<CMD>IndentBlanklineRefresh<CR>")
    map("", "zr", "zr<CMD>IndentBlanklineRefresh<CR>")
    map("", "zO", "zO<CMD>IndentBlanklineRefresh<CR>")
    map("", "zA", "zA<CMD>IndentBlanklineRefresh<CR>")
    map("", "zR", "zR<CMD>IndentBlanklineRefresh<CR>")

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

M.bufferline = function()
    -- Go to next/previous tab
    map("n", "<M-.>", "<CMD>BufferLineCycleNext<CR>")
    map("n", "<M-,>", "<CMD>BufferLineCyclePrev<CR>")

    -- Close tab
    map("n", "<M-c>", "<CMD>bdelete<CR>")

    -- Go to nth visible buffer
    map("n", "<M-1>", "<CMD>BufferLineGoToBuffer 1<CR>")
    map("n", "<M-2>", "<CMD>BufferLineGoToBuffer 2<CR>")
    map("n", "<M-3>", "<CMD>BufferLineGoToBuffer 3<CR>")
    map("n", "<M-4>", "<CMD>BufferLineGoToBuffer 4<CR>")
    map("n", "<M-5>", "<CMD>BufferLineGoToBuffer 5<CR>")
    map("n", "<M-6>", "<CMD>BufferLineGoToBuffer 6<CR>")
    map("n", "<M-7>", "<CMD>BufferLineGoToBuffer 7<CR>")
    map("n", "<M-8>", "<CMD>BufferLineGoToBuffer 8<CR>")
    map("n", "<M-9>", "<CMD>BufferLineGoToBuffer 9<CR>")
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
