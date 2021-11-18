-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Format the buffer using `terraform fmt` on write
vim.g.terraform_fmt_on_save = true

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
