require('lualine').setup({
  options = {
    icons_enabled = true,
    globalstatus = false,
    theme = 'auto',
    component_separators = '',
    -- section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
  },
  sections = {
    --   lualine_c = {
    --     'lsp_progress'
    --   }
    -- },
    --  lualine_a = {
    --    --{ 'mode', separator = { left = '' }, right_padding = 2 },
    --    { 'mode', separator = { left = '' }, right_padding = 2, left_padding = 4 },
    --  },
    -- lualine_c = {
    --   'lsp_progress',
    -- },
    lualine_x = {
      { 'filename', path = 4 },
      { 'filetype', colored = true, icon_only = true },
    }
    --   {
    --     'filetype',
    --     colored = true,             -- Displays filetype icon in color if set to true
    --     icon_only = false,          -- Display only an icon for filetype
    --     icon = { align = 'left' },  -- Display filetype icon on the right hand side
    --     -- icon =    {'X', align='right'}
    --     -- Icon string ^ in table is ignored in filetype component
    --   }
    -- }
  },
  diagnostics = {
    enable = true,
  }
})
