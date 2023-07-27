require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "vimdoc",
    "javascript",
    "typescript",
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
  ident = { enable = true },
  rainbow = {
    enable = true
  }
}
