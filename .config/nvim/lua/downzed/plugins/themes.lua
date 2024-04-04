-- global function to set theme

function ApplyTheme(theme)
  local last_theme = vim.g.colors_name
  vim.cmd.colorscheme(theme or last_theme)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    -- config = function()
    --   require("gruvbox").setup({
    --     transparent_mode = true,
    --   })
    --   ApplyTheme("gruvbox")
    -- end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      ApplyTheme('rose-pine-moon')
    end,
  },
}
