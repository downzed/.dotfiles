return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      local crates = require("crates")
      crates.setup()
    end,
  },
}
