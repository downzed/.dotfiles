local ll = require('lualine');

local seps = {
  left = "",
  right = "",
}

ll.setup({
  options = {
    component_separators = seps,
    section_separators = seps,
    icons_enabled = true,
    theme = 'auto',
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
