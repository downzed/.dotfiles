local w = require('wezterm')

local font = w.font_with_fallback({
  "GitLab Mono",
  {
    family = "Symbols Nerd Font Mono",
    scale = 0.75
  },
})

local keys = {
  {
    key = 'F',
    mods = 'CMD|SHIFT',
    action = w.action.ToggleFullScreen
  },
}

return {
  window_background_opacity = 0.75,
  macos_window_background_blur = 50,
  color_scheme = 'Rosé Pine (Gogh)',
  keys = keys,
  font = font,
  font_size = 18,

  enable_tab_bar = false,
  window_decorations = "RESIZE",
  native_macos_fullscreen_mode = false,

  -- Scrollback
  scrollback_lines = 10000,

  -- Performance tweaks
  max_fps = 90,
  -- dpi = 72.0,
  dpi = 144.0,
}
