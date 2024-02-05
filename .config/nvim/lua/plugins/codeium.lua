return {
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			vim.g.codeium_disable_bindings = 1
			local opts = { expr = true }

			vim.keymap.set("i", "<c-a>", function()
				return vim.fn["codeium#Accept"]()
			end, opts)

			vim.keymap.set("i", "<c-N>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, opts)

			vim.keymap.set("i", "<c-s-b>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, opts)

			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, opts)
		end,
	},
}
