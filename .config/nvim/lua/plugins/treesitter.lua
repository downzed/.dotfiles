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
        fold = {
          enable = true,
          disable = {}
        }
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require('treesitter-context').setup({
        multiline_threshold = 4, -- Maximum number of lines to show for a single context
      })
    end
  },
}
