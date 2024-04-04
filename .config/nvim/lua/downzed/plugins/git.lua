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

      local wk = require("which-key")

      local opts = {
        noremap = true,
        silent = true,
        prefix = "<leader>",
      }

      wk.register({
        g = {
          name = "[G]it",
          f = { "<cmd>Git<cr>", "[F]ugitive" },
          s = {
            name = "[S]igns",
            h = { gs.stage_hunk, "Stage Hunk" },
            x = { gs.reset_hunk, "Reset Hunk" },
            s = { "<cmd>Gitsigns<cr>", "Show Signs" },
            p = { gs.preview_hunk, "Preview Hunk" },
            ["]"] = { gs.next_hunk, "Next Hunk" },
            ["["] = { gs.prev_hunk, "Prev Hunk" },
          }
          -- s = { gs.stage_hunk, "Stage Hunk" },
          -- r = { gs.reset_hunk, "Reset Hunk" },
          -- u = { gs.undo_stage_hunk, "Undo Stage Hunk" },
        }
      }, opts)
    end,
  },
}
