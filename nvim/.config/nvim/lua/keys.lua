-- keys.lua
--
-- This module defines the global, default keybindings. Note that some
-- keybindings may be defined in plugins, or plugin-related modules.
--
-------------------------------------------------------------------------------

-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable arrow key movement
for _, mode in ipairs({ "i", "n" }) do
	for _, key in ipairs({ "Down", "Left", "Right", "Up" }) do
		vim.api.nvim_set_keymap(mode, "<" .. key .. ">", "<NOP>", { noremap = true })
	end
end

-- Disable keys
vim.api.nvim_set_keymap("", "<C-z>", "<NOP>", {}) -- disable exiting with C-z
vim.api.nvim_set_keymap("n", "<CR>", "<NOP>", { silent = true }) -- disable enter in normal mode
vim.api.nvim_set_keymap("v", "<C-c>", "<NOP>", { noremap = true }) -- disable C-c in visual mode
vim.api.nvim_set_keymap("n", "<S-k>", "<NOP>", {}) -- disable manpage on current word

-- Saner mode exits
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-j>", "<ESC>", { noremap = true })

-- Saner start and EOL keys
for _, mode in ipairs({ "n", "v" }) do
	vim.api.nvim_set_keymap(mode, "H", "^", { noremap = true })
	vim.api.nvim_set_keymap(mode, "L", "g_", { noremap = true })
end

-- Saner selection bindings
vim.api.nvim_set_keymap("n", "dH", "d^", { noremap = true }) -- delete from cursor to BOL
vim.api.nvim_set_keymap("n", "dL", "dg_", { noremap = true }) -- delete from cursor to EOL
vim.api.nvim_set_keymap("n", "vH", "v^", { noremap = true }) -- select from cursor to BOL
vim.api.nvim_set_keymap("n", "vL", "vg_", { noremap = true }) -- select from cursor to EOL
vim.api.nvim_set_keymap("n", "yH", "y^", { noremap = true }) -- yank from cursor to BOL
vim.api.nvim_set_keymap("n", "yL", "yg_", { noremap = true }) -- yank from cursor to EOL

-- Saner buffer movement
vim.api.nvim_set_keymap("n", "<S-tab>", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<tab>", ":bnext<CR>", { noremap = true, silent = true })

-- Close the current buffer
vim.api.nvim_set_keymap("n", "<leader>bd", ":bd<cr>", { noremap = true, silent = true})

-- Close the current buffer and move to the previous one
-- This is especially useful for longstanding sessions as it replicates the idea of closing a tab
-- found in other editors (where the file closes, but the program stays active)
vim.api.nvim_set_keymap("n", "<leader>bq", ":b#<bar>bd#<cr>", { noremap = true, silent = true })

-- Exit terminal insert mode with C-j
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n>", { noremap = true })

-- Move between splits more naturally
local mode_to_escape_binding = {
	n = "",
	i = "<esc>",
	v = "<esc>",
	t = "<C-\\><C-n>",
}

for mode, escape in pairs(mode_to_escape_binding) do
	for _, key in pairs({ "h", "j", "k", "l" }) do
		-- skip C-j for terminal insert mode
		if mode == "t" and key == "j" then
			goto continue
		end

		vim.api.nvim_set_keymap(mode, "<C-" .. key .. ">", escape .. "<C-w>" .. key, { noremap = true })

		::continue::
	end
end

-- Simpler split resizing
vim.api.nvim_set_keymap("n", "+", "<C-w>+", { noremap = true }) -- increase height
vim.api.nvim_set_keymap("n", "-", "<C-w>-", { noremap = true }) -- decrease height
vim.api.nvim_set_keymap("n", "<bar>", "<C-w><", { noremap = true }) -- decrease width
vim.api.nvim_set_keymap("n", "\\", "<C-w>>", { noremap = true }) -- increase width

-- Prevent deselection after (de-)indentation
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })

-- Prevent accidental deletion of folds
vim.api.nvim_set_keymap("n", "zd", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "zE", "<NOP>", { noremap = true })

-- Find and replace instances of the word under the cursor
vim.api.nvim_set_keymap("n", "<S-k>", ":%s/\\/<<C-r><C-w>\\>/", { noremap = true })

-- Initiate buffer scrolling more naturally
vim.api.nvim_set_keymap("t", "<C-u>", "<C-\\><C-n><C-u>", { noremap = true })

-- FZF-related keybindings
vim.api.nvim_set_keymap("n", "<C-p>", ":Files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-o>", ":Buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-g>", ":GFiles<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":Rg<space>", { noremap = true })

-- Code navigation
local completion_bindings = {
	["<c-k>"] = "signature_help",
	["K"] = "hover",
	["g0"] = "document_symbol",
	["gD"] = "implementation",
	["gG"] = "type_definition",
	["gW"] = "workspace_symbol",
	["ga"] = 'code_action',
	["gd"] = "definition",
	["gr"] = "references",
}

for k, v in pairs(completion_bindings) do
	vim.api.nvim_set_keymap("n", k, "<cmd>lua vim.lsp.buf." .. v .. "()<CR>", { noremap = true, silent = true })
end
