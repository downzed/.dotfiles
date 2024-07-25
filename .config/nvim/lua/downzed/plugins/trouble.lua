return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>xt",
        "<cmd>Trouble diagnostics toggle focus=false win.position=right<cr>",
        desc = "Diagnostics: [T]rouble",
      },
      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Diagnostics: [Q]uickfix",
      },
      {
        "<leader>xl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Diagnostics: [L]oclist",
      },
      {
        "<leader>td",
        "<cmd>Trouble todo<cr>",
        desc = "[T]oggle to[D]o",
      },
    }
  },
}
