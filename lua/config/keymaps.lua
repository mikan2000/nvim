vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
	{ from = "K",             to = "7k" },
	{ from = "J",             to = "7j" },
	{ from = "H",             to = "0" },
	{ from = "L",             to = "$" },
	{ from = "U",             to = "<C-r>" },
	{ from = "S",             to = ":w<CR>" },
	{ from = "Q",             to = ":q<CR>" },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

local function run_vim_shortcut(shortcut)
	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
	vim.api.nvim_feedkeys(escaped_shortcut, 'n', true)
end
