-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Create an augroup for this module
vim.api.nvim_define_augroup("Toml", true)

-- Restart the language server after editing Cargo.toml
vim.api.nvim_define_autocmd("BufWritePost", "Cargo.toml", ":LspRestart", "Toml")

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
