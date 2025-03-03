--- @name ApplyTheme
--- @param theme string | nil
--- @return nil
--- @description Applies a given theme
--- @usage :lua ApplyTheme("default")
function _G.ApplyTheme(theme)
  local current_theme = theme or 'default'
  vim.cmd.colorscheme(current_theme)
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
  -- _G.ApplyTheme('phosmon')
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
  { 'stevearc/dressing.nvim' },
  { 'loctvl842/monokai-pro.nvim' },
}
