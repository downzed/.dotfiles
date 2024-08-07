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
    vim.cmd.colorscheme("default")
  else
    vim.o.background = "dark"
    _G.ApplyTheme("oldworld")
  end
end

vim.keymap.set("n", "<leader>tm", _G.ToggleMode, { desc = "[T]oggle [M]ode" })

return {
  {
    "echasnovski/mini.icons",
    version = false,
    opts = {}
  },
  { "stevearc/dressing.nvim" },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        integrations = { -- You can disable/enable integrations
          markdown = true,
          mason = true,
          navic = true,
          neo_tree = true,
          neorg = true,
          noice = true,
        },
      })
      _G.ApplyTheme("oldworld")
    end
  }

}
