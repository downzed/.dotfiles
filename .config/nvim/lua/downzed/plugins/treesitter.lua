return {
  {
    "nvim-treesitter/nvim-treesitter",
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
        'c',
        'cpp',
        'cmake',
        'lua',
        'luadoc',
        'python',
        'rust',
        'toml',
        'javascript',
        'typescript',
        'markdown',
      },
    },
    config = function(opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
