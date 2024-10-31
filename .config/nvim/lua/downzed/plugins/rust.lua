return {
  { "rust-lang/rust.vim" },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      local crates = require("crates")
      crates.setup()
    end,
  },
}
