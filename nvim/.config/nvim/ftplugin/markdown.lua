-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Create an augroup for this module
vim.api.nvim_define_augroup("Markdown", true)

-- Align Github-flavored markdown tables
vim.api.nvim_set_keymap("v", "<bar>", ":EasyAlign *<bar><CR>", { noremap = true })

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
