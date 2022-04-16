local present, zenmode = pcall(require, "zen-mode")
if not present then
    return
end

zenmode.setup {
    window = {
        backdrop = 1,
        width = 100,
        height = 0.95,
        options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
        },
    },
    plugins = {
        options = {
            foldenable = false,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
    },
}
