-- This module defines global settings for completion
-- Individual, language-specific settings and rules can be found in the relevant package(s)

-- menuone: popup even when there's only a single match
-- noinsert: do not insert text until a selection is made
-- noselect: do not automatically select an item
vim.o.completeopt = "menuone,noinsert,noselect"

-- avoid showing extra messages when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

-- configure plugin: cmp
local cmp = require("cmp")

cmp.setup({
	-- enable LSP snippets
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},

	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>' ] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
})
