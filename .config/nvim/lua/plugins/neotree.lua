return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree reveal position=left toggle<CR>")
    require("neo-tree").setup({
      window = {
        position = "left",
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          update_root = true,
        },
      },

    })
	end,
}
