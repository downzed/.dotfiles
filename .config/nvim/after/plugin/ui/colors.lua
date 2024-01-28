function _G.SetColorscheme(color)
  color = color or "tokyonight-night"
  vim.cmd.colorscheme(color)
end

SetColorscheme()

vim.keymap.set("n", "<leader>th", require('telescope.builtin').colorscheme, { desc = "Select Colorscheme" })


function _G.SwitchMode()
  if vim.api.nvim_get_option("background") == "light" then
    vim.cmd.colorscheme("tokyonight-night")
    vim.api.nvim_set_option("background", "dark")
  else
    vim.cmd.colorscheme("tokyonight-day")
    vim.api.nvim_set_option("background", "light")
  end
end
