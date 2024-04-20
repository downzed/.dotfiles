-- global function to set theme

function ApplyTheme(theme)
  local current_theme = theme or vim.g.colors_name

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  vim.cmd.colorscheme(current_theme or "rose-pine-moon")
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
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 2
      ApplyTheme('gruvbox-material')
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- config = function()
    --   require('rose-pine').setup({
    --     disable_background = true,
    --     variant = "main",      -- auto, main, moon, or dawn
    --     dark_variant = "main", -- main, moon, or dawn
    --     dim_inactive_windows = false,
    --     extend_background_behind_borders = true,

    --     styles = {
    --       bold = true,
    --       italic = false,
    --       transparency = true
    --     },
    --   })
    -- end,
  },
}
