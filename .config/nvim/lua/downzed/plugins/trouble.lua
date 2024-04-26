return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      local trouble = require("trouble")

      require("which-key").register({
        t = {
          name = "[T]rouble: ",
          t = { trouble.toggle, "Toggle" },
          l = { function() trouble.toggle("loclist") end, "Loclist" },
          q = { function() trouble.toggle("quickfix") end, "Quickfix" },
          d = { function() trouble.toggle("todo") end, "Todo" },
        }
      }, { prefix = "<leader>" })
    end,
  },
}
