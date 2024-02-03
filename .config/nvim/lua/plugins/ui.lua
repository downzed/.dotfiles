return {
  {
    "stevearc/dressing.nvim",
    lazy = true,
    config = function()
      require("dressing").setup()
    end,
  },
  { "MunifTanjim/nui.nvim", lazy = true },
}
