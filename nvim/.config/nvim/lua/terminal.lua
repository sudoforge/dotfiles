-- This module exists to define autocmds for terminal buffers, which we do
-- outside of an ftplugin so that they execute appropriately when the editor is
-- opened with a terminal buffer, e.g. `nvim +term`

require("utils")

-- Create augroups
vim.api.nvim_define_augroup("Terminal", true)

-- Define autocmds that exec on TermEnter
vim.api.nvim_define_autocmd("TermOpen,BufEnter", "term://*", "startinsert", "Terminal")
vim.api.nvim_define_autocmd("BufLeave", "term://*", "stopinsert", "Terminal")
