function _G.SetColorscheme(color)
  color = color or "rose-pine-main"
  vim.cmd.colorscheme(color)
end

SetColorscheme()

vim.keymap.set("n", "<leader>th", require('telescope.builtin').colorscheme, { desc = "Select Colorscheme" })


function _G.SwitchMode()
  if vim.api.nvim_get_option("background") == "light" then
    SetColorscheme("rose-pine-moon")
    vim.api.nvim_set_option("background", "dark")
  else
    SetColorscheme("rose-pine-dawn")
    vim.api.nvim_set_option("background", "light")
  end
end
