return {
	"alexghergh/nvim-tmux-navigation",
	"ThePrimeagen/vim-be-good", -- practive vim
	"tpope/vim-commentary", -- comment/uncomments
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
}
