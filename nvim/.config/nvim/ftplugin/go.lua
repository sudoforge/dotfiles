-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Create an augroup for this module
vim.api.nvim_define_augroup("Golang", true)

-- Define location for custom template files
vim.g.go_template_file = CONFIG_PATH .. "/nvim/templates.d/go/base.go"
vim.g.go_template_test_file = CONFIG_PATH .. "/nvim/templates.d/go/test.go"

-- Use goimports as the formatting command if it is available
vim.g.go_fmt_command = "gopls"

-- Formatter configuration
vim.b.go_fmt_options = { goimports = "-local hydra/" }

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
