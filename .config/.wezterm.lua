local w = require('wezterm')

local font = w.font_with_fallback({
  "GitLab Mono",
  {
    family = "Symbols Nerd Font Mono",
    scale = 0.75
  },
})

local leader = {
  key = 's',
  mods = 'CTRL',
  timeout_milliseconds = 1000
}

local keys = {
  { -- Split horizontally
    key = '|',
    mods = 'LEADER',
    action = w.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },

  { -- Split vertiacally
    key = '_',
    mods = 'LEADER',
    action = w.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },

  { -- Zoom pane
    key = 'z',
    mods = 'LEADER',
    action = w.action.TogglePaneZoomState
  },

  {
    key = 'l',
    mods = 'ALT',
    action = w.action.ShowLauncher
  },
  { key = 'l', mods = 'LEADER', action = w.action({ ActivatePaneDirection = 'Right' }) },
  { key = 'h', mods = 'LEADER', action = w.action({ ActivatePaneDirection = 'Left' }) },
  { key = 'k', mods = 'LEADER', action = w.action({ ActivatePaneDirection = 'Up' }) },
  { key = 'j', mods = 'LEADER', action = w.action({ ActivatePaneDirection = 'Down' }) },
}

-- w.on('gui-startup', function()
--   local _, _, window = w.mux.spawn_window({})
--   window:gui_window():maximize()
-- end)

local config = {
  leader = leader,
  hide_tab_bar_if_only_one_tab = true,
  -- default_prog = { 'zsh', '-l', '-c', 'exec $SHELL' },
  window_background_opacity = .95,
  -- macos_window_background_blur = 88,
  -- color_scheme = 'Rosé Pine Moon (Gogh)',
  color_scheme = 'Monokai Pro (Gogh)',
  keys = keys,
  font = font,
  font_size = 17,

  -- enable_tab_bar = false,
  window_decorations = 'RESIZE',
  native_macos_fullscreen_mode = false,

  -- Scrollback
  scrollback_lines = 10000,

  -- Performance tweaks
  max_fps = 90,
  -- dpi = 72.0,
  -- dpi = 144.0,
}

return config
