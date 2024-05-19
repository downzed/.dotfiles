return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true },
      rainbow = { enable = true },
      fold = { enable = true, disable = {} },
      ensure_installed = {
        "lua",
        "tsx",
        "javascript",
        "vim",
        "query",
        "css",
        "scss",
        "markdown",
        "rust",
      },
    },
    config = function(opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
