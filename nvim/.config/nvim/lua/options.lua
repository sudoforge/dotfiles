require("utils")

-- General Settings
--
-- The options set below are general defaults, and may be overridden on a
-- per-buffer basis depending on the filetype or other such property.
-------------------------------------------------------------------------------

-- Define local constants
local COLORSCHEME = "gruvbox"
local TABSTOP = 4

-- Automatically detect filetypes
--vim.o.filetype = "plugin indent on"
vim.cmd("filetype plugin indent on")

-- Session-related options
vim.cmd("set ssop-=folds") -- do not store folds
vim.cmd("set ssop-=options") -- do not store global or local options

-- Highlight options
vim.cmd("highlight vertsplit guifg=bg guibg=bg")

-- Global Settings
--
-- These should be considered "global defaults", as some options (e.g. indentation) may be
-- overridden by filetype plugins for specific filetypes.
--
-- See `:help <option>` for more information.
---------------------------------------------------------------------------------------------------
vim.o.autoindent = true -- indent at the same level as the previous line
vim.o.autowrite = true -- automatically write changed buffers
vim.o.background = "dark" -- assume a dark background
vim.o.backup = false -- disable backup files
vim.o.compatible = false -- disable vi compatibility mode
vim.o.expandtab = true -- insert spaces when <tab> is pressed
vim.o.gdefault = true -- use the global flag by default for :substitute invocations
vim.o.ignorecase = true -- ignore character case when searching
vim.o.joinspaces = false -- don't add spaces after punctuation after joining lines
vim.o.laststatus = 2 -- always show the statusline
vim.o.number = true -- display line numbers in the gutter
vim.o.relativenumber = true -- make line numbers relative to the current line
vim.o.ruler = true -- display row and column information in the statusline
vim.o.shiftwidth = 0 -- zero makes this equal to 'tabstop'
vim.o.smartcase = true -- override 'ignorecase' when query contains [A-Z] characters
vim.o.softtabstop = -1 -- negative numbers make this equal to 'shiftwidth'
vim.o.splitbelow = true -- horizontal splits are placed below
vim.o.splitright = true -- vertical splits are placed to the right
vim.o.swapfile = false -- disable swap files
vim.o.syntax = "on" -- enable syntax highlighting
vim.o.tabstop = TABSTOP -- indent every X columns
vim.o.textwidth = LINE_WIDTH -- break lines at X characters
vim.o.undofile = false -- disable undo files
vim.o.updatetime = 300 -- trigger a CursorHold event after cursor inactivity
vim.o.wrap = true -- automatically wrap lines

-- AUTOCOMMANDS
---------------------------------------------------------------------------------------------------
vim.api.nvim_define_augroup("Global", true)

-- Automatically save when leaving buffers
-- This is mostly useful when navigating between splits, as the 'autowrite' setting doesn't apply
vim.api.nvim_define_autocmd("BufLeave", "*", "silent! wall", "Global")

-- Set the colorscheme
vim.api.nvim_define_autocmd("vimenter", "*", "colorscheme " .. COLORSCHEME, "Global")
