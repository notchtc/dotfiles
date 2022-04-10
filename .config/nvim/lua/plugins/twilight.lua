local present, twilight = pcall(require, "twilight")
if not present then
    return
end

twilight.setup {
    dimming = {
        inactive = true,
    },
    context = 5,
    treesitter = true,
    expand = {
        "function",
        "method",
        "table",
        "if_statement",
    },
}
