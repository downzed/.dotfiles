-- sketchybar --bar position=top height=40 blur_radius=30 color=0x40000000

-- ##### Changing Defaults #####
-- # We now change some default values, which are applied to all further items.
-- # For a full list of all available item properties see:
-- # https://felixkratz.github.io/SketchyBar/config/items

-- default=(
--   padding_left=5
--   padding_right=5
--   # icon.font="Hack Nerd Font:Bold:17.0"
--   # label.font="Hack Nerd Font:Bold:14.0"
--   icon.font="IosevkaTerm Nerd Font Mono:Bold:17.0"
--   label.font="IosevkaTerm Nerd Font Mono:Bold:14.0"
--   icon.color=0xffffffff
--   label.color=0xffffffff
--   icon.padding_left=4
--   icon.padding_right=4
--   label.padding_left=4
--   label.padding_right=4
-- )
-- sketchybar --default "${default[@]}"

sbar.bar({
  topmost = "window",
  height = 40,
  color = 0x40000000, -- colors.bar.bg,
  padding_right = 0,
  padding_left = 0,
})

sbar.default({
  label = {
    font = {
      family = "IosevkaTerm Nerd Font Mono",
      size = 16.0
    },
    padding_left = 4,
    padding_right = 4,
  },
  icon = {
    font = {
      family = "IosevkaTerm Nerd Font Mono",
      size = 20.0
    },
    padding_left = 4,
    padding_right = 4,
  }
})
