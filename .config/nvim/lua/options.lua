local opt = vim.opt

-- Set shell to more minimal one
opt.shell = "/bin/sh"

-- Make life better
opt.clipboard:append "unnamedplus"
opt.mouse = "a"
opt.undofile = true

-- Numbers
opt.number = false
opt.relativenumber = false

-- Only case sensitive when there are uppercase letters
opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

-- Spaces > tabs
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Enable listchars
opt.list = true
opt.listchars = {
    trail = "·",
    tab = "→ ",
    extends = ">",
    precedes = "<",
}

-- Set fillchars
opt.fillchars = {
    eob = " ", -- Remove EOB chars
}

-- Hide concealed text
opt.conceallevel = 2

-- Folding with treesitter
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldnestmax = 1

-- Faster vim or something
opt.lazyredraw = true
opt.swapfile = false

-- Stuff to look cool
opt.termguicolors = true
opt.background = "dark"
opt.laststatus = 3
opt.cmdheight = 0
opt.showmode = false
opt.guicursor:append "a:blinkon1"
opt.cursorline = true

-- Disable nvim intro
opt.shortmess:append "casI"

--disable builtin plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
