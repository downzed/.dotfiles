require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim'
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
  }
})
