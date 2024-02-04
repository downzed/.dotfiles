return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        theme = 'tokyonight'
      },
      sections = {
        lualine_c = {
          -- invoke `progress` here.
          require('lsp-progress').progress,
        },
      }
    })
  end
}
