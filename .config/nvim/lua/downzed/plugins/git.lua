local map = function(key, cmd, desc)
  vim.keymap.set("n", key, cmd, { silent = true, desc = "Git: " .. desc })
end


return {
  "tpope/vim-fugitive",
  -- {
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",  -- required
  --     "sindrets/diffview.nvim", -- optional - Diff integration
  --   },
  --   config = function()
  --     require("neogit").setup()
  --     map("<leader>gng", "<cmd>Neogit<cr>", "Neo[G]it")
  --   end,
  -- },
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

      map("<leader>gs", "<cmd>Gitsigns<cr>", "[G]it [S]igns")
      map("<leader>gf", "<cmd>Git<cr>", "[G]it [F]ugitive")
      map("<leader>gss", gs.stage_hunk, "[G]it[s]igns [S]tage Hunk")
      map("<leader>gsx", gs.reset_hunk, "[G]it[s]igns [x] Reset Hunk")
      map("<leader>gsp", gs.preview_hunk, "[G]it[s]igns [P]review hunk")
      map("<leader>gs]", gs.next_hunk, "[G]it[s]igns ] next hunk")
      map("<leader>gs[", gs.prev_hunk, "[G]it[s]igns [ previous hunk")
    end,
  },
}
