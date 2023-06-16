require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "lua", "rust", "python", "vim", "javascript", "typescript", "tsx", "css", "html", "markdown", "json", "yaml", "toml"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}
