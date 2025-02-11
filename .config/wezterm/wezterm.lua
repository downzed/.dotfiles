local ui = require('ui')
local w = require('wezterm')

local act = w.action
local config = {}

if w.config_builder then
  config = w.config_builder()
end

w.on('update-right-status', function(window, _pane)
  window:set_right_status(window:active_workspace())
end)

local leader = {
  key = 's',
  mods = 'CTRL',
  timeout_milliseconds = 1000,
}

local keys = {
  {
    key = 'r',
    mods = 'CMD|SHIFT',
    action = act.ReloadConfiguration,
  },
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane({ confirm = true }),
  },
  -- tmux shortcuts
  {
    key = '[',
    mods = 'LEADER',
    action = act.ActivateCopyMode,
  },

  {
    key = 'c',
    mods = 'LEADER',
    action = act.SpawnTab('CurrentPaneDomain'),
  },

  {
    key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine({
      description = 'Enter new name for tab',
      action = w.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },

  -- splits
  --- horizontally
  {
    key = '|',
    mods = 'LEADER',
    action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
  --- vertiacally
  {
    key = '_',
    mods = 'LEADER',
    action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },

  -- panes
  --- rotate panes
  {
    mods = 'LEADER',
    key = 'Space',
    action = act.RotatePanes('Clockwise'),
  },

  --- toggle zoom
  {
    key = 'z',
    mods = 'LEADER',
    action = act.TogglePaneZoomState,
  },
  --- activate pane
  { key = 'l', mods = 'LEADER', action = act({ ActivatePaneDirection = 'Right' }) },
  { key = 'h', mods = 'LEADER', action = act({ ActivatePaneDirection = 'Left' }) },
  { key = 'k', mods = 'LEADER', action = act({ ActivatePaneDirection = 'Up' }) },
  { key = 'j', mods = 'LEADER', action = act({ ActivatePaneDirection = 'Down' }) },

  --- resize panes
  { key = 'h', mods = 'LEADER|CTRL', action = act.AdjustPaneSize({ 'Left', 8 }) },
  { key = 'l', mods = 'LEADER|CTRL', action = act.AdjustPaneSize({ 'Right', 8 }) },
  { key = 'j', mods = 'LEADER|CTRL', action = act.AdjustPaneSize({ 'Down', 8 }) },
  { key = 'k', mods = 'LEADER|CTRL', action = act.AdjustPaneSize({ 'Up', 8 }) },

  { key = 'z', mods = 'CMD|SHIFT', action = act.ToggleFullScreen },

  -- workspaces
  -- {
  --   key = '$',
  --   mods = 'LEADER|SHIFT',
  --   action = act.PromptInputLine {
  --     description = 'Enter new name for session',
  --     action = w.action_callback(
  --       function(window, pane, line)
  --         if line then
  --           mux.rename_workspace(
  --             window:mux_window():get_workspace(),
  --             line
  --           )
  --         end
  --       end
  --     ),
  --   },
  -- },
  -- {
  --   key = 'w',
  --   mods = 'LEADER|SHIFT',
  --   action = act.SwitchToWorkspace {
  --     name = 'Work',
  --     cwd = '~/Developer/work/',
  --
  --   }
  -- },
  -- {
  --   key = 'c',
  --   mods = 'LEADER|SHIFT',
  --   action = act.SwitchToWorkspace {
  --     name = 'CS50',
  --   }
  -- },
  -- switch workspaces
  { key = 'n', mods = 'LEADER|CTRL', action = act.SwitchWorkspaceRelative(1) },
  { key = 'p', mods = 'LEADER|CTRL', action = act.SwitchWorkspaceRelative(-1) },

  -- launchers
  {
    key = 'l',
    mods = 'CMD|SHIFT',
    action = act.ShowLauncher,
  },
  {
    key = 'w',
    mods = 'CMD|SHIFT',
    action = act.ShowLauncherArgs({
      flags = 'FUZZY|WORKSPACES',
    }),
  },
}

w.on('gui-startup', function()
  local _, _, window = w.mux.spawn_window({})
  window:gui_window():maximize()
end)

config.leader = leader

config.keys = keys

config.scrollback_lines = 10000

config.native_macos_fullscreen_mode = false

config.use_resize_increments = false

config.enable_tab_bar = true

-- config.dpi = 144.0

local tabs_config = {
  unzoom_on_switch_pane = true,
  tab_bar_at_bottom = false,
  hide_tab_bar_if_only_one_tab = false,
}
w.plugin
  .require('https://github.com/yriveiro/wezterm-tabs')
  .apply_to_config(config, { tabs = tabs_config })

ui.apply_to_config(config)

return config
