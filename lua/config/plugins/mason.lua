return {
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
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require('mason-lspconfig').setup()
		end
	}
}
