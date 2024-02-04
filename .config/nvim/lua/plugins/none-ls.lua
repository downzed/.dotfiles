return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.beautysh,
				null_ls.builtins.completion.luasnip,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.diagnostics.eslint,
			},
		})
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
