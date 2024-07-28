-- global function to set theme
--- Applies a theme to the editor and removes background colors from Normal and NormalFloat highlight groups.
--- @param theme string
function _G.ApplyTheme(theme)
  local current_theme = theme or "default"
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.cmd.colorscheme(current_theme)
end

--- Switches theme between dark and light themes
function _G.ToggleMode()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

return {
  {
    "echasnovski/mini.icons",
    version = false,
    opts = {}
    -- config = function()
    --   require("mini.icons").setup()
    -- end
  },
  {
    'tanvirtin/monokai.nvim',
    priority = 1000,
    opts = {},
    config = function()
      require('monokai').setup({
        palette = require('monokai').pro
      })
      _G.ApplyTheme("monokai_pro")
    end

  },


  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   opts = {
  --     variant = "main",      -- auto, main, moon, or dawn
  --     dark_variant = "main", -- main, moon, or dawn
  --   },
  --   config = function(_, opts)
  --     require("rose-pine").setup(opts)
  --     vim.o.background = "dark"
  --     _G.ApplyTheme("rose-pine")
  --   end
  -- }
}
