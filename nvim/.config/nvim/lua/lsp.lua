-- This module contains configuration related to the native language server

require("utils")

-- AUTOCOMMANDS
-- Autocommands are defined in a local function and propagated to the different LSP client
-- configuration via `on_attach`, which means that the commands will run (be defined) when an LSP
-- client attaches to a buffer.
-------------------------------------------------------------------------------

local function on_attach()
	vim.api.nvim_define_augroup("Lsp", true)

	-- Show diagnostic information on CursorHold
	vim.api.nvim_define_autocmd("CursorHold", "<buffer>", "lua vim.diagnostic.open_float()", "Lsp")

	-- Format on write
	vim.api.nvim_define_autocmd("BufWritePre", "<buffer>", "lua vim.lsp.buf.formatting_sync()", "Lsp")
end

-- LANGUAGE SERVER CONFIGURATION
--------------------------------------------------------------------------------
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Rust
if vim.fn.executable("rust-analyzer") == 1 then
	require("rust-tools").setup {
		capabilities = capabilities,
		on_attach = on_attach,

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
end

-- Golang
if vim.fn.executable("gopls") == 1 then
	lspconfig.gopls.setup {
		cmd = { "gopls" },
		capabilities = capabilities,
		filetypes = { "go", "gomod" },
		on_attach = on_attach,
	}
end

-- Java
if vim.fn.executable("java-language-server") then
	lspconfig.java_language_server.setup {
		cmd = { "java-language-server" },
		capabilities = capabilities,
		filetypes = { "java" },
		on_attach = on_attach,
	}
end

-- Lua
if vim.fn.executable("lua-language-server") then
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
		on_attach = on_attach,
	}
end

-- Python
if vim.fn.executable("pyright-langserver") then
	lspconfig.pyright.setup {
		cmd = { "pyright-langserver", "--stdio" },
		capabilities = capabilities,
		on_attach = on_attach,
	}
end

-- Terraform
if vim.fn.executable("terraform-ls") then
	lspconfig.terraformls.setup {
		cmd = { "terraform-ls", "serve" },
		capabilities = capabilities,
		on_attach = on_attach,
	}
end
