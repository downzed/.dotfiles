return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local config = require("nvim-treesitter.configs")

      config.setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autotag = { enable = true },
        rainbow = { enable = true },
        ensure_installed = { "rust", "lua", "vim" },
        -- sync_install = false,
        -- auto_install = true,
        -- indent = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
