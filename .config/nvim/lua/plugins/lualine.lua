return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "rose-pine",
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = {
              left = "",
              right = "",
            },
            right_padding = 2,
          },
        },
        lualine_b = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 4,
          },
        },
        lualine_x = {
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { right = "", left = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {},
    })
  end,
}
