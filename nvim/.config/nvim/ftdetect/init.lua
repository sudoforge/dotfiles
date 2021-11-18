require("utils")

local map = {
	bzl = {
		"*.bazel",
		"*.sky",
		"*.star",
		".bazelrc.local",
		"WORKSPACE",
	},
	groovy = {
		"Jenkinsfile",
	},
	ledger = {
		".ledgerrc",
		"*.ledger",
	},
	proto = {
		"*.proto",
	},
	terminal = {
		"term://*",
	},
}

for f, v in pairs(map) do
	for _, p in ipairs(v) do
		if f == "terminal" then
			events = { "TermOpen" }
		else
			events = { "BufNewFile", "BufRead" }
		end

		vim.api.nvim_define_autocmd(events, p, "setlocal filetype=" .. f)
	end
end
