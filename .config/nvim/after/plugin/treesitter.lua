local ts_config = require('nvim-treesitter.configs')

ts_config.setup {
  ensure_installed = {
    "vimdoc",
    "vim",
    "markdown",
    "javascript",
    "typescript",
    "bash",
    "python",
    "lua",
    "rust"
  },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  rainbow = { enable = true }
}
