return {
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
}
