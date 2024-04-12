-- global function to set theme

function ApplyTheme(theme)
  local last_theme = vim.g.colors_name
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.cmd.colorscheme(theme or last_theme or "rose-pine-moon")
end

function ToggleMode()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

return {
  {
    'f4z3r/gruvbox-material.nvim',
    name = 'gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- configs go here
      vim.g.gruvbox_material_transparent_background = 1
      ApplyTheme('gruvbox-material')
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup({
        transparent = true,
      })
      -- ApplyTheme('kanagawa')
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        variant = "main",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        styles = {
          bold = true,
          italic = false,
          transparency = true
        },
      })
      -- ApplyTheme('rose-pine-moon')
    end,
  },
}
