return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_c = {
					-- invoke `progress` here.
					require("lsp-progress").progress,
          {"filename", path = 4},
				},
			},
			inactive_sections = {},
		})
	end,
}
