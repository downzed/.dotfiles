--- @name ApplyTheme
--- @param theme string | nil
--- @return nil
--- @description Applies a given theme
--- @usage :lua ApplyTheme("default")
function _G.ApplyTheme(theme)
  local current_theme = theme or 'default'
  vim.cmd.colorscheme(current_theme)
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

_G.default_bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
--- @name ToggleOpacity
--- @return nil
--- @description Toggles transparent background
--- @usage :lua ToggleOpacity()
function _G.ToggleOpacity()
  local hl_groups = {
    'Normal',
    'SignColumn',
    'NormalNC',
    'NvimTreeNormal',
    'NvimTreeNormalNC',
    'EndOfBuffer',
    'MsgArea',
  }

  -- local default_bg = vim.o.background == "dark" and "#262626" or "#ffffff"
  if vim.api.nvim_get_hl(0, { name = 'Normal' }).bg == nil then
    for _, name in ipairs(hl_groups) do
      vim.api.nvim_set_hl(0, string.format('%s', name), { bg = _G.default_bg })
    end
  else
    for _, name in ipairs(hl_groups) do
      vim.api.nvim_set_hl(0, string.format('%s', name), { bg = 'none' })
    end
  end
end

--- @name ToggleMode
--- @description Switches theme between dark and light themes
--- @usage :lua ToggleMode()
function _G.ToggleMode()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
    -- vim.cmd('PhosmonLight')
    _G.ApplyTheme('monokai-pro-light')
  else
    vim.o.background = 'dark'
    -- vim.cmd('PhosmonDark')
    _G.ApplyTheme('monokai-pro-machine')
  end
end

vim.keymap.set('n', '<leader>tm', _G.ToggleMode, { desc = '[T]oggle [M]ode' })
vim.keymap.set('n', '<leader>ty', _G.ToggleOpacity, { desc = '[T]oggle opacit[y]' })

return {
  { 'echasnovski/mini.icons', version = false, opts = {} },
  { 'stevearc/dressing.nvim' },
  { 'loctvl842/monokai-pro.nvim' },
  -- {
  --   'polirritmico/monokai-nightasty.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     hl_styles = {
  --       -- Custom styles for this groups: (See `:help nvim_set_hl`, Parameters, {val} for supported keys)
  --       comments = { italic = true },
  --       keywords = { italic = false },
  --       functions = { italic = false },
  --       variables = { italic = false },
  --     },
  --   },
  --   config = function(_, opts)
  --     require('monokai-nightasty').setup(opts)
  --   end,
  -- },
}
