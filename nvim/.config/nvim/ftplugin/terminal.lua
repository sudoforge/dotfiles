-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Don't show the signcolumn in terminal buffers
vim.wo.signcolumn = "no"

-- Hide terminal buffers, don't destroy them
vim.bo.bufhidden = "hide"

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
