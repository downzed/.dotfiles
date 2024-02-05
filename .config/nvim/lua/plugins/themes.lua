return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd.colorscheme("rose-pine-moon")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
