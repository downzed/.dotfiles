return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      local rose = require("rose-pine")
      rose.setup({
        highlight_groups = {
          TelescopeResultsTitle = { fg = "surface", bg = "surface" },
          TelescopeBorder = { fg = "surface", bg = "surface" },
          TelescopeSelection = { fg = "text", bg = "overlay", bold = true },
          TelescopeSelectionCaret = { fg = "text", bg = "highlight_med" },
          TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

          TelescopeTitle = { fg = "base", bg = "love" },
          TelescopePromptTitle = { fg = "base", bg = "love" },
          TelescopePreviewTitle = { fg = "base", bg = "foam" },

          TelescopePromptNormal = { bg = "overlay" },
          TelescopePromptBorder = { fg = "overlay", bg = "overlay" },
          TelescopePromptPrefix = { fg = "love", bg = "overlay" },

          NeotreeCursorLine = { bg = "surface" },
          NeotreeNormal = { bg = "#161420" },
          NeotreeWinSeparator = { bg = "#161420", fg = "#161420" },
          CmpWinBorder = { fg = "overlay", bg = "base" },
        },
      })
      vim.cmd.colorscheme("rose-pine-main")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
