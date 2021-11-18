-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Create an augroup for this module
vim.api.nvim_define_augroup("Lua", true)

-- Use goimports as the formatting command if it is available
vim.bo.expandtab = false

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
