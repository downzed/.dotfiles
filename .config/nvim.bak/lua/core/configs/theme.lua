vim.o.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require('nightfox').setup({
  options = {
    transparent = true,
  }
})

vim.cmd.colorscheme('nightfox')
