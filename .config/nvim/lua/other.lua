local au = vim.api.nvim_create_autocmd

-- Remove trailing whitespaces and newlines when saving
au("BufWritePre", { command = [[%s/\s\+$//e]] })
au("BufWritePre", { command = [[%s/\n\+\%$//e]] })

au("InsertEnter", {
    once = true,
    callback = function()
        require("mini.pairs").setup {}
    end,
})

--[[
  au({ "VimEnter", "BufEnter" }, {
    callback = function()
        if #vim.api.nvim_list_bufs() == 1 then
            vim.opt.showtabline = 1
        else
            vim.opt.showtabline = 2
        end
    end,
})
--]]

au("VimLeave", { command = "set guicursor=a:ver2-blinkon1" })

-- We can write to the shadafile now
vim.opt.shadafile = ""
