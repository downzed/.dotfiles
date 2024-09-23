return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
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
          path = 4
        },
      },
      lualine_x = {
        "filetype",
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
        }
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
  },
}
