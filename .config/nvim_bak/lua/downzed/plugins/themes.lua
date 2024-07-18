-- global function to set theme
--- Applies a theme to the editor and removes background colors from Normal and NormalFloat highlight groups.
--- @param theme string
function _G.ApplyTheme(theme)
  local current_theme = theme or "default"
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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
    config = function()
      require("mini.icons").setup()
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        variant = "moon",      -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        styles = {
          transparency = true
        },
      })
      vim.o.background = "dark"
      _G.ApplyTheme("rose-pine")
    end
  }
}
