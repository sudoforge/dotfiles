-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Navigate with C-j and C-k
-- These are default bindings, but get overriding by the system-level ftplugin
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })


-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
