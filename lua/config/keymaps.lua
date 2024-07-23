vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_nvi = { "n", "v", "i" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
	{ from = "K",										to = "7k" },
	{ from = "J",										to = "7j" },
	{ from = "H",										to = "0" },
	{ from = "L",										to = "$" },
	{ from = "U",										to = "<C-r>" },
	{ from = "S",										to = ":w<CR>" },
	{ from = "Q",										to = ":q<CR>" },
	{ from = "`",										to = "<ESC>",		mode = mode_nvi },
	{ from = "<TAB>",								to = "<ESC>",		mode = mode_nv },
	{ from = "<C-l>",								to = "<C-w>l" },
	{ from = "<C-h>",								to = "<C-w>h" },
	{ from = "<C-j>",								to = "<C-w>j" },
	{ from = "<C-k>",								to = "<C-w>k" },
	{ from = "<Leader>v",						to = "<C-w>v" },
	{ from = "<Leader>s",						to = "<C-w>s" },
	{ from = "<leader><leader>",		to = ":noh<CR>" },
	{ from = "<Leader>t",						to = ":NvimTreeOpen<CR>" },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

local function run_vim_shortcut(shortcut)
	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
	vim.api.nvim_feedkeys(escaped_shortcut, 'n', true)
end

-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
