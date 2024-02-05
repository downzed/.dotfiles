return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function(_, opts)
      local trouble = require("trouble")
      trouble.setup(opts)
      vim.keymap.set("n", "<leader>xx", trouble.toggle)
    end,
  },
}
