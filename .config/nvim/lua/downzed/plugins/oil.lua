return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require('oil')
    oil.setup()

    require('which-key').register({
      ["<C-n>"] = { oil.open_float, "Open Oil" },
    })
  end
}
