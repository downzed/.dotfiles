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
        theme = "monokai-pro",
        component_separators = { right = "", left = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "netrw", "Netrw", "neotree", "Neotree", "neo-tree" },
      },

      sections = {
        lualine_a = {
          {
            "mode",
            icons_enabled = true,
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
            icon = "",
            left_padding = 1,
          },
          "diff",
          "diagnostics"
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 5,
          },
        },
        lualine_y = {
          "progress"
        },
        lualine_z = {
          {
            "location",
            left_padding = 1
          },
        },
      },
      winbar = {
        lualine_c = {
          {
            function()
              return require('nvim-navic').get_location()
            end,
            cond = function()
              return require('nvim-navic').is_available()
            end
          },
        }
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
