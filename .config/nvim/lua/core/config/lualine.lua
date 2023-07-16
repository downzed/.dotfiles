require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto'
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_c = {
      {
        'filename',
        path = 4
      }
    },
  }
})
