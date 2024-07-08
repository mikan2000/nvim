local set = vim.o
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
set.number = true
set.relativenumber = true
-- 在 copy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

-- keybindings
local opt = { noremap = true, silent = true }
vim.keymap.set("n", "H", "0", opt)
vim.keymap.set("n", "J", "7j", opt)
vim.keymap.set("n", "K", "7k", opt)
vim.keymap.set("n", "L", "$", opt)
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)
vim.keymap.set("n", "<leader><leader>", ":noh<CR>", opt)

-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	{
		"RRethy/nvim-base16",
		lazy = true,
	},
	{
		cmd = "Telescope",
		keys = {
			{ "<leader>p", ":Telescope find_files<CR>", desc = "find files" },
			{ "<leader>P", ":Telescope live_grep<CR>", desc = "grep file" },
			{ "<leader>rs", ":Telescope resume<CR>", desc = "resume" },
			{ "<leader>q", ":Telescope oldfiles<CR>", desc = "oldfiles" },
		},
    		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		-- or                              , branch = '0.1.x',
      		dependencies = { 'nvim-lua/plenary.nvim' }
    	},
	{
	    event = "VeryLazy",
	    "williamboman/mason.nvim",
	    build = ":MasonUpdate",
	    config = function()
		require('mason').setup()
	    end
	},
	{
		event = "VeryLazy",
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
})
vim.cmd.colorscheme("base16-tender")
