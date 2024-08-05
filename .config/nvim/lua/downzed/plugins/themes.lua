--- @name ApplyTheme
--- @param theme string | nil
--- @return nil
--- @description Applies a given theme
--- @usage :lua ApplyTheme("default")
function _G.ApplyTheme(theme)
  local current_theme = theme or "default"
  vim.cmd.colorscheme(current_theme)
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

--- @name ToggleMode
--- @return nil
--- @description Switches theme between dark and light themes
--- @usage :lua ToggleMode()
function _G.ToggleMode()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

--- @name SetBGMode
--- @param mode "dark" | "light"
--- @usage :lua SetBGMode()
function _G.SetBGMode(mode)
  local _mode = mode or "dark"
  vim.o.background = _mode
end

return {
  {
    "echasnovski/mini.icons",
    version = false,
    opts = {}
  },
  {
    'stevearc/dressing.nvim',
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      --- @type "lackluster" | "lackluster-mint" | "lackluster-hack" | "lackluster-night"
      _G.ApplyTheme("lackluster-night")
    end,
  }
  -- {
  --   -- "downzed/darkvoid.nvim",
  --   -- branch = "feat/lualine",
  --   dir = "~/Developer/lua/darkvoid.nvim",
  --   config = function()
  --     require("darkvoid").setup({
  --       transparent = true,
  --       glow = true
  --     })
  --     _G.ApplyTheme("darkvoid")
  --   end
  -- },
  -- {
  --   'tanvirtin/monokai.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('monokai').setup { palette = require('monokai').pro }
  --     _G.ApplyTheme("monokai_pro")
  --   end
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   opts = {
  --     variant = "main",      -- auto, main, moon, or dawn
  --     dark_variant = "main", -- main, moon, or dawn
  --   },
  -- config = function(_, opts)
  --   require("rose-pine").setup(opts)
  -- end
  -- }
}
