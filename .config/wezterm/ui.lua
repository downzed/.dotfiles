local font = require('font')

local w = require('wezterm')

-- This is the module table that we will export
local M = {}

-- This function is private to this module and is not visible
-- outside.
local function private_helper()
  w.log_error('ui load error!')
end

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function M.apply_to_config(config)
  private_helper()
  config.animation_fps = 1
  config.cursor_blink_ease_in = 'Linear'
  config.cursor_blink_ease_out = 'Linear'

  config.color_scheme = 'terafox'

  config.macos_window_background_blur = 25
  config.window_background_opacity = 0.88
  config.window_decorations = 'RESIZE'
  config.window_padding = {
    left = 5,
    right = 5,
    bottom = 0,
    top = 0,
  }

  font.apply_to_config(config)
end

return M
