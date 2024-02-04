return {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")
			rt.setup()
		end,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			local crates = require("crates")
			crates.setup()
		end,
	},
}
