function _G.SetColorscheme(color)
  color = color or "github_light_colorblind"
  vim.cmd.colorscheme(color)
end

SetColorscheme()

vim.keymap.set("n", "<leader>th", require('telescope.builtin').colorscheme, { desc = "Select Colorscheme" })


function _G.SwitchMode()
  if vim.api.nvim_get_option("background") == "light" then
    vim.cmd.colorscheme("github_dark_colorblind")
    vim.api.nvim_set_option("background", "dark")
  else
    vim.cmd.colorscheme("github_light_colorblind")
    vim.api.nvim_set_option("background", "light")
  end
end
