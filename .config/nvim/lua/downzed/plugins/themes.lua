---@diagnostic disable, 111: 113
-- global function to set theme

--- Applies a theme to the editor and removes background colors from Normal and NormalFloat highlight groups.
--- @param theme "rose-pine" | "monokai-pro" | any
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
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "machine", --- classic | octagon | pro | machine | ristretto | spectrum
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
