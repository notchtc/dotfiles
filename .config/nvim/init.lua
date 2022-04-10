-- Don't write to shadafile yet
vim.opt.shadafile = "NONE"

local modules = {
    "impatient",
    "options",
    "mappings",
    "other",
}

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end

require("mappings").misc()
