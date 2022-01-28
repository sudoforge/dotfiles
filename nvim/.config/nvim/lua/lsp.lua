-- This module contains configuration related to the native language server

require("utils")

-- AUTOCOMMANDS
-------------------------------------------------------------------------------
vim.api.nvim_define_augroup("Lsp", true)

-- Show diagnostic information on CursorHold
vim.api.nvim_define_autocmd("CursorHold", "<buffer>", "lua vim.diagnostic.open_float()", "Lsp")


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

-- Golang
lspconfig.gopls.setup {
	cmd = { "gopls" },
	capabilities = capabilities,
	filetypes = { "go", "gomod" },
}

-- Lua
lspconfig.sumneko_lua.setup {
	cmd = { "/usr/bin/lua-language-server" },
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

-- Python
lspconfig.pyright.setup {
	cmd = { "pyright-langserver", "--stdio" },
	capabilities = capabilities,
}

-- Terraform
lspconfig.terraformls.setup {
	cmd = { "terraform-ls", "serve" },
	capabilities = capabilities,
}
