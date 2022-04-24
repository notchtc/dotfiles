local au = vim.api.nvim_create_autocmd

-- Remove trailing whitespaces and newlines when saving
au("BufWritePre", { command = [[%s/\s\+$//e]] })
au("BufWritePre", { command = [[%s/\n\+\%$//e]] })

-- Reload Xresources on change
au("BufWritePost", {
    pattern = "Xresources",
    command = "!xrdb -load " .. vim.fn.expand "$XDG_CONFIG_HOME" .. "x11/Xresources",
})

-- Quit nvim-tree when it's the last window
au("BufEnter", {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})

-- We can write to the shadafile now
vim.opt.shadafile = ""
