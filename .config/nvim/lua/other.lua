local cmd = vim.cmd

-- Remove trailing whitespaces and newlines when saving
cmd [[ au BufWritePre * %s/\s\+$//e ]]
cmd [[ au BufWritePre * %s/\n\+\%$//e ]]

cmd [[ au BufWritePost Xresources !xrdb -load ~/.config/x11/Xresources ]]

-- Active statusline
cmd [[ au WinEnter * setlocal statusline=%!luaeval('statusline()') ]]
-- Inactive statusline
cmd [[ au WinLeave * setlocal statusline=%!luaeval('statusline_inactive()') ]]
cmd [[ au BufEnter NvimTree setlocal statusline=%!luaeval('statusline_inactive()') ]]

-- We can write to the shada file now
vim.opt.shadafile = ""
