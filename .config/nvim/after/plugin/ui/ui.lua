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
  },
  content_hooks = {
    starter.gen_hook.aligning('center', 'center'),
  },
})

-- vim keymap with Shift+a
-- vim.keymap.set('n', '<S-a>', ':lua MiniStarter.open()<cr>')
vim.keymap.set('n', '<leader>A', ':lua toggle_starter()<cr>')


-- function to toggle MiniStarter
function _G.toggle_starter()
  if vim.bo.filetype == 'starter' then
    vim.cmd('lua MiniStarter.close()')
  else
    vim.cmd('lua MiniStarter.open()')
  end
end
