-- This module defines utilities (functions, constants) that are used elsewhere

-- nvim_define_augroup() creates an augroup, optionally clearing it
--
-- This is intended to be a (somewhat) drop-in replacement for the upcoming API
-- changes [0], and should be deleted after it is merged (with any required
-- callsite modifications, of course)
--
-- TODO(sudoforge): remove after upstream introduces vim.api.nvim_define_augroup()
-- [0]: https://github.com/neovim/neovim/pull/14661
function vim.api.nvim_define_augroup(name, clear)
	if type(name) ~= "string" or name == "" then
		error("name should be a non-empty string", 1)
	end

	if type(clear) ~= "boolean" and type(clear) ~= nil then
		error("clear should be a boolean or nil (default: true)", 1)
	end

	vim.cmd("augroup " .. name)
	if clear == true or clear == nil then
		vim.cmd("autocmd!")
	end
	vim.cmd("augroup END")
end

-- Create an autocmd
--
-- This is intended to be a mostly-drop-in replacement for the upcoming API changes [0], and should
-- be deleted after it is merged (with any required callsite modifications, of course)
--
-- TODO(sudoforge): remove after upstream introduces vim.api.nvim_define_autocmd()
-- [0]: https://github.com/neovim/neovim/pull/14661
function vim.api.nvim_define_autocmd(event, pattern, action, group)
	local autocmd = { "autocmd" }

	if type(group) == "string" and group ~= "" then
		table.insert(autocmd, group)
	elseif group ~= nil then
		error("group should be a non-empty string (or nil)", 1)
	end

	if type(event) == "table" then
		table.insert(autocmd, table.concat(event, ","))
	elseif type(event) == "string" and event ~= "" then
		table.insert(autocmd, event)
	else
		error("event should be a table or a non-empty string", 1)
	end

	if type(pattern) == "string" and pattern ~= "" then
		table.insert(autocmd, pattern)
	else
		error("pattern should be a non-empty string", 1)
	end

	if type(action) == "function" then
		local bytecode = ""
		for c in string.dump(action):gmatch(".") do
			bytecode = bytecode .. "\\" .. c:byte()
		end
		table.insert(autocmd, 'lua load("' .. bytecode .. '")()')
	elseif type(action) == "string" and action ~= "" then
		table.insert(autocmd, action)
	else
		error("action should be a lua function or a non-empty string", 1)
	end

	vim.cmd(table.concat(autocmd, " "))
end
