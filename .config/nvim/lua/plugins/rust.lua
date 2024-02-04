return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	ft = { "rust" },
	config = function()
		local bufnr = vim.api.nvim_get_current_buf()
		vim.keymap.set("n", "<leader>a", function()
			vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
		end, { silent = true, buffer = bufnr })
	end,
}
