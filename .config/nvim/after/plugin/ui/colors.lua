function _G.SetColorscheme(color)
  color = color or "rose-pine-moon"
  -- color = color or "tokyonight-night"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeotreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeogitHunkBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeogitHunkHeader", { bg = "none" })
end

SetColorscheme()

vim.keymap.set("n", "<leader>th", require('telescope.builtin').colorscheme, { desc = "Select Colorscheme" })
