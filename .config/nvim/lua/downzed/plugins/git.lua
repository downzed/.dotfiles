return {
  "tpope/vim-fugitive",
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

      local map = function(key, cmd, desc)
        vim.keymap.set("n", key, cmd, { silent = true, desc = "Git: " .. desc })
      end

      map("<leader>gs", "<cmd>Gitsigns<cr>", "[G]it[s]igns")
      map("<leader>gf", "<cmd>Git<cr>", "[G]it [F]ugitive")
      map("<leader>gss", gs.stage_hunk, "[G]it[s]igns [S]tage Hunk")
      map("<leader>gsx", gs.reset_hunk, "[G]it[s]igns [x] Reset Hunk")
      map("<leader>gs]", gs.next_hunk, "[G]it[s]igns ] next hunk")
      map("<leader>gs[", gs.prev_hunk, "[G]it[s]igns [ prev hunk")
    end,
  },
}
