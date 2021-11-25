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
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<S-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<C-Space>'] = cmp.mapping.confirm({
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
