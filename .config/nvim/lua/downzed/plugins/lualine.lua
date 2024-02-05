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
        section_separators = { left = " ", right = " " },
        -- section_separators = { left = "", right = "" },
        disabled_filetypes = { "starter", "Starter", "neotree", "Neotree", "neo-tree" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icons_enabled = true,
            separator = {
              left = " ",
              right = " ",
              -- left = "",
              -- right = "",
            },
            right_padding = 0,
            fmt = function(str)
              local mode_map = {
                ['NORMAL'] = 'N',
                ['INSERT'] = 'I',
                ['VISUAL'] = 'V',
                ['V-LINE'] = 'V-L',
                ['V-BLOCK'] = 'V-B',
                ['SELECT'] = 'Sel',
                ['S-LINE'] = 'S-L',
                ['S-BLOCK'] = 'S-B',
                ['COMMAND'] = 'Cmd',
                ['EX'] = 'Ex',
                ['TERMINAL'] = 'Term',
                ['REPLACE'] = 'Rplc',
                ['V-REPLACE'] = 'V-Rplc',
                ['ENTER'] = 'Ent',
                ['MORE'] = 'More',
                ['SHELL'] = 'sh'
              }
              return mode_map[str:upper()] or str
            end
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
          {
            "location",
            separator = {
              right = "",
              left = ""
              -- right = "",
              -- left = ""
            },
            left_padding = 1
          },
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
