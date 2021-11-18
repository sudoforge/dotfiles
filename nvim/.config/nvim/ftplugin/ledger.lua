-- Circuit break if this plugin has already completed
if vim.b.did_local_ftplugin == true then
	return 0
end

-- Create an augroup for this module
vim.api.nvim_define_augroup("Ledger", true)

-- Allow for longer lines
vim.g.ledger_maxwidth = 100

-- Set the location of the entry file
vim.g.ledger_main = REPO_PATH .. "/books/main.ledger"

-- Use { and } to navigate valid ledger blocks, instead of paragraphs
vim.api.nvim_set_keymap("n", "{", [[?^\(\w\|\d\|\~\|!\)<CR>:noh<CR>]], { noremap = true })
vim.api.nvim_set_keymap("n", "}", [[/^\(\w\|\d\|\~\|!\)<CR>:noh<CR>]], { noremap = true })

-- Align all lines on buffer write or leave
vim.api.nvim_define_autocmd("BufWrite,BufLeave", "<buffer>", ":LedgerAlignBuffer", "Ledger")

-- Set extra command line options
vim.g.ledger_extra_options = "--pedantic --explicit --check-payees"

-- Signal that the plugin has completed
vim.b.did_local_ftplugin = true
