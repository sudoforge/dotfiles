-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Create an augroup for this module
vim.api.nvim_define_augroup("GitConfig", true)

-- Delete the buffer upon losing visibility
-- This exists to support terminating the buffer so that GIT_EDITOR completes
vim.bo.bufhidden = "delete"

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
