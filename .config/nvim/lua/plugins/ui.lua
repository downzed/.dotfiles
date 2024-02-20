return {
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    'stevearc/dressing.nvim',
    opts = {},
    config = function()
      local dressing = require("dressing")
      dressing.setup()
    end
  }
}
