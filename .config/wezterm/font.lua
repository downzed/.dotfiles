local w = require('wezterm')

local M = {}

local font = w.font_with_fallback({
  {
    family = 'Maple Mono',
    italic = false,
    weight = 'Regular',
  },
  {
    family = 'Symbols Nerd Font Mono',
    scale = 0.75,
    italic = false,
  },
})

local function private_helper()
  w.log_error('font load error!')
end

function M.apply_to_config(config)
  private_helper()
  config.font = font
  config.font_size = 18
  config.harfbuzz_features = { 'calt=0' }
end

return M
