-- global function to set theme

function SetTransparent()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd.colorscheme('rose-pine-main')
      SetTransparent()
    end,
  },
}
