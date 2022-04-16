local present, packer = pcall(require, "packerInit")
if not present then
    return false
end

local use = packer.use

return packer.startup(function()
    use {
        "wbthomason/packer.nvim",
        event = "VimEnter",
    }

    use "lewis6991/impatient.nvim"

    use {
        "norcalli/nvim-base16.lua",
        after = "packer.nvim",
        as = "colorscheme",
        config = function()
            require "theme"
        end,
    }

    use {
        "akinsho/bufferline.nvim",
        after = "colorscheme",
        config = function()
            require "plugins.bufferline"
        end,
        setup = function()
            require("mappings").bufferline()
        end,
    }

    use {
        "nvim-lua/plenary.nvim",
        event = "BufRead",
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufRead", "BufNewFile" },
        config = function()
            require "plugins.treesitter"
        end,
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        after = "colorscheme",
        event = "BufRead",
        config = function()
            require("plugins.others").blankline()
        end,
    }

    use {
        "lewis6991/gitsigns.nvim",
        after = "plenary.nvim",
        config = function()
            require "plugins.gitsigns"
        end,
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "VimEnter",
        config = function()
            require("plugins.others").colorizer()
        end,
    }

    use {
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle", "NvimTreeFocus" },
        config = function()
            require "plugins.nvimtree"
        end,
        setup = function()
            require("mappings").nvimtree()
        end,
    }

    use {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require "plugins.zenmode"
        end,
        setup = function()
            require("mappings").zenmode()
        end,
    }

    use {
        "folke/twilight.nvim",
        after = "zen-mode.nvim",
        config = function()
            require "plugins.twilight"
        end,
    }
end)
