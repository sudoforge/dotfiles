-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Show line numbers
-- These get reset by the global ftplugin
vim.o.number = true
vim.o.relativenumber = true

-- Navigate up with C-k
-- This gets overridden by the default mapping for C-k in help buffers
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
