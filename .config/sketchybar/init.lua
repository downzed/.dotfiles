-- Require the sketchybar module
sbar = require("sketchybar")

-- Bundle the entire initial configuration into a single message to sketchybar
-- sbar.show()
sbar.begin_config()
require("bar")
-- Add your plugins here
sbar.add_item("clock", {
  name = "clock",
  icon = "",
  update_freq = 10,
})
sbar.end_config()

-- Run the event loop of the sketchybar module (without this there will be no
-- callback functions executed in the lua module)
sbar.event_loop()
