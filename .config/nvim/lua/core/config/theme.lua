require('nightfox').setup({
  options = {
    transparent = true, -- Disable setting background
    terminal_colors = true,
    styles = {
      comments = "italic",
      keywords = "underline,bold",
      types = "bold",
    }
  }
})

vim.keymap.set("n", "<leader>th", require('telescope.builtin').colorscheme, {})

function SetColorscheme(color)
  color = color or "duskfox"
  vim.cmd.colorscheme(color)
  -- nightfox supports transparency
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorscheme()
