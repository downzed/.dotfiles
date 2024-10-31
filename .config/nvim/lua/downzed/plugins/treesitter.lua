return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "cmake",
        "css",
        "lua",
        "luadoc",
        "python",
        "html",
        "rust",
        "toml",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "markdown",
        "bash",
      },
      auto_install = true,
      sync_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true },
      rainbow = { enable = true },
      fold = { enable = true, disable = {} },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
