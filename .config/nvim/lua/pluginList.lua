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

    use "nathom/filetype.nvim"
    use "lewis6991/impatient.nvim"

    use {
        "echasnovski/mini.nvim",
        after = "packer.nvim",
        config = function()
            require "theme"
            require("mini.surround").setup {}
            require("mini.tabline").setup { show_icons = false }
        end,
    }

    use {
        "nvim-lua/plenary.nvim",
        event = "BufRead",
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = "require 'plugins.treesitter'",
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = "require('plugins.others').blankline()",
        setup = "require('mappings').blankline()",
    }

    use {
        "lewis6991/gitsigns.nvim",
        after = "plenary.nvim",
        config = "require 'plugins.gitsigns'",
    }

    use {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = "require('plugins.others').colorizer()",
        setup = "require('mappings').colorizer()",
    }

    use {
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle", "NvimTreeFocus" },
        config = "require 'plugins.nvimtree'",
        setup = "require('mappings').nvimtree()",
    }

    use {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = "require 'plugins.zenmode'",
        setup = "require('mappings').zenmode()",
    }

    use {
        "folke/twilight.nvim",
        after = "zen-mode.nvim",
        config = "require 'plugins.twilight'",
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        ft = "markdown",
        config = "require('plugins.others').null_ls()",
    }

    use {
        "folke/trouble.nvim",
        after = "null-ls.nvim",
        config = "require 'plugins.trouble'",
    }
end)
