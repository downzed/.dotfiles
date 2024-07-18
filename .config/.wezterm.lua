local w = require('wezterm')
local act = w.action

-- w.on('update-right-status', function(window, _pane)
--   window:set_right_status(window:active_workspace())
-- end)

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
  -- splits
  --- horizontally
  {
    key = '|',
    mods = 'LEADER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  --- vertiacally
  {
    key = '_',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' }
  },

  -- panes
  --- toggle zoom
  {
    key = 'z',
    mods = 'LEADER',
    action = act.TogglePaneZoomState
  },
  --- activate pane
  { key = 'l', mods = 'LEADER', action = act({ ActivatePaneDirection = 'Right' }) },
  { key = 'h', mods = 'LEADER', action = act({ ActivatePaneDirection = 'Left' }) },
  { key = 'k', mods = 'LEADER', action = act({ ActivatePaneDirection = 'Up' }) },
  { key = 'j', mods = 'LEADER', action = act({ ActivatePaneDirection = 'Down' }) },

  --- resize pane
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },

  -- workspaces
  {
    key = 'w',
    mods = 'LEADER|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'Work',
      cwd = '~/Developer/work/',

    }
  },
  {
    key = 'c',
    mods = 'LEADER|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'CS50',
    }
  },

  -- launchers
  {
    key = 'l',
    mods = 'CMD|SHIFT',
    action = act.ShowLauncher
  },
  {
    key = 'w',
    mods = 'CMD|SHIFT',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  }
}

local key_tables = {
  -- Defines the keys that are active in our resize-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'resize_pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  resize_pane = {
    { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape',     action = 'PopKeyTable' },
  }
}
-- w.on('gui-startup', function()
--   local _, _, window = w.mux.spawn_window({})
--   window:gui_window():maximize()
-- end)

local config = {
  -- leader = leader,
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = .88,
  macos_window_background_blur = 25,
  color_scheme = 'rose-pine',
  -- keys = keys,
  -- key_tables = key_tables,
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
