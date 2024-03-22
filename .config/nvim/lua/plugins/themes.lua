return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd.colorscheme("rose-pine-moon")
      -- set background transparent
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

      -- -- set all backgrounds transparent
      -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloatNC", { bg = "none" })

      -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "none" })
    end,
  },
}
