return {
	"alexghergh/nvim-tmux-navigation",
	"ThePrimeagen/vim-be-good", -- practive vim
	"RRethy/vim-illuminate", -- highlight keyword
	"tpope/vim-commentary", -- comment/uncomments
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
}
