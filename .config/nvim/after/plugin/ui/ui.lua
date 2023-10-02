local dressing = require('dressing')
local notify = require('notify')
local starter = require('mini.starter')

dressing.setup()

notify.setup({
  timeout = 500,
  render = "minimal",
  background_colour = "#00000000",
})

starter.setup({
  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(10, true),
    starter.sections.telescope(),
  },
})
vim.keymap.set('n', '<leader>A', ':lua MiniStarter.open()<cr>')
