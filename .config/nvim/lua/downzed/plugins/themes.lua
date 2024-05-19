-- global function to set theme

--- Applies a theme to the editor and removes background colors from Normal and NormalFloat highlight groups.
--- @param theme "rose-pine" | "monokai-pro" | nil
function ApplyTheme(theme)
  local current_theme = theme or vim.g.colors_name
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.cmd.colorscheme(current_theme or "rose-pine-main")
end

--- Switches theme between dark and light themes
function ToggleMode()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        variant = "main",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true,        -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "spectrum", --- classic | octagon | pro | machine | ristretto | spectrum
        transparent_background = true,
        background_clear = {
          -- "float_win",
          -- "toggleterm",
          "which-key",
          "notify",
          "neo-tree",
        }
      })
      ApplyTheme("monokai-pro")
    end
  }
}
