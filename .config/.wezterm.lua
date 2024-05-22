local w = require('wezterm')

local font = w.font_with_fallback({
  { family = "NotoSansM Nerd Font" },
  { family = "Symbols Nerd Font Mono", scale = 0.65 },
})

local keys = {
  {
    key = 'F',
    mods = 'CMD|SHIFT',
    action = w.action.ToggleFullScreen
  },
}

local config = {
  window_background_opacity = 0.88,
  macos_window_background_blur = 40,
  color_scheme = 'Monokai (terminal.sexy)',
  keys = keys,
  font = font,
  font_size = 16,

  enable_tab_bar = false,
  window_decorations = "RESIZE",
  native_macos_fullscreen_mode = false,

  -- Performance tweaks
  max_fps = 90,
  dpi = 144.0,
}

return config
