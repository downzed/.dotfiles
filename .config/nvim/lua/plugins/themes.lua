return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight")
			vim.api.nvim_set_option("background", "dark")
		end,
	},
}
