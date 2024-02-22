return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        theme = "rose-pine",
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "starter", "Starter", "neotree", "Neotree", "neo-tree" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = {
              left = "",
              right = "",
            },
            right_padding = 1,
          },
        },
        lualine_b = {
          {
            "branch",
            left_padding = 1,
          },
          "diff",
          "diagnostics"
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 4,
          },
        },
        lualine_y = {
          "progress"
        },
        lualine_z = {
          { "location", separator = { right = "", left = "" }, left_padding = 1 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
    })
  end,
}
