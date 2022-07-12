local au = vim.api.nvim_create_autocmd

-- Remove trailing whitespaces and newlines when saving
au("BufWritePre", { command = [[%s/\s\+$//e]] })
au("BufWritePre", { command = [[%s/\n\+\%$//e]] })

-- Quit nvim-tree when it's the last window
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil then
            vim.cmd "quit"
        end
    end,
})

vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
    callback = function()
        if #vim.api.nvim_list_bufs() == 1 then
            vim.opt.showtabline = 1
        else
            vim.opt.showtabline = 2
        end
    end,
})

au("VimLeave", { command = "set guicursor=a:ver2-blinkon1" })

-- We can write to the shadafile now
vim.opt.shadafile = ""
