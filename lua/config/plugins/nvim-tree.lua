return {
	cmd = "NvimTreeOpen",
	keys = {
		{"<Leader>t", ":NvimTreeToggle<CR>"}
	},
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {}
	end,
}
