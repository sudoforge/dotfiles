-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Navigate windows with C-j and C-k
-- These are default bindings, but get overriding by the system-level ftplugin
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })

-- More natural quickfix list navigation
vim.api.nvim_set_keymap("n", "<C-n>", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":cprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-g>", ":clast<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gg", ":cfirst<CR>", { noremap = true, silent = true })

-- Override the default <leader>bd behavior
-- <leader>bd is habitually used to close buffers but keep the split open, but
-- when closing the quickfix list, it is desirable to close its split.
vim.api.nvim_set_keymap("n", "<leader>bd", ":cclose<CR>", { noremap = true, silent = true })

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
