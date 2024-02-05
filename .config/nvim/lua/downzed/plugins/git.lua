return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gs = require("gitsigns")

      gs.setup({
        signs = {
          add = { text = "+" },
          change = { text = "|" },
          delete = { text = "-" },
          topdelete = { text = " ̅" },
          changedelete = { text = "~" },
          untrack = { text = "·" },
        },
      })

      local gitsigns_opts = {
        desc = "Show Gitsigns",
        noremap = true,
        silent = true,
      }

      vim.api.nvim_set_keymap("n", "<leader>gp", ":Gitsigns<CR>" , gitsigns_opts)
    end,
  },

  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "fugitive" })
    end,
  },
}
