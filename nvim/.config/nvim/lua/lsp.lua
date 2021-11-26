-- This module contains configuration related to the native language server

require("utils")

-- AUTOCOMMANDS
-------------------------------------------------------------------------------
vim.api.nvim_define_augroup("Lsp", true)

-- Show diagnostic information on CursorHold
vim.api.nvim_define_autocmd("CursorHold", "<buffer>", "lua vim.lsp.diagnostic.show_line_diagnostics()", "Lsp")

-- Format on write
vim.api.nvim_define_autocmd("BufWritePre", "<buffer>", "lua vim.lsp.buf.formatting_sync(nil, 200)", "Lsp")

-- LANGUAGE SERVER CONFIGURATION
--------------------------------------------------------------------------------
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Rust
require("rust-tools").setup {
	capabilities = capabilities,

	tools = {
		autoSetHints = true,
		hover_with_actions = true,
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},

	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
}
