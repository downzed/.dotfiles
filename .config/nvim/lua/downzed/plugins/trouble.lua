return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      local trouble = require("trouble")

      local map = function(key, cmd, desc)
        vim.keymap.set("n", key, cmd, { silent = true, desc = "Trbl: " .. desc })
      end

      map("<leader>tt", trouble.toggle, "[T]oggle [T]rouble")
      map("<leader>tl", function() trouble.toggle("loclist") end, "[T]oggle [L]oclist")
      map("<leader>tq", function() trouble.toggle("quickfix") end, "[T]oggle [Q]uickfix")
      map("<leader>td", function() trouble.toggle("todo") end, "[T]oggle [T]odo")
      -- require("which-key").register({
      --   t = {
      --     name = "[T]rouble: ",
      --     t = { trouble.toggle, "Toggle" },
      --     l = { function() trouble.toggle("loclist") end, "Loclist" },
      --     q = { function() trouble.toggle("quickfix") end, "Quickfix" },
      --     d = { function() trouble.toggle("todo") end, "Todo" },
      --   }
      -- }, { prefix = "<leader>" })
    end,
  },
}
