-- local startpage = require('alpha')
-- local themeConfig = require('alpha.themes.startify').config
-- startpage.setup(themeConfig)
vim.keymap.set('n', '<leader>A', ':lua MiniStarter.open()<cr>')

local starter = require('mini.starter')
starter.setup({
  items = {
    starter.sections.builtin_actions(),
    -- starter.sections.recent_files(10, false),
    starter.sections.recent_files(10, true),
    starter.sections.telescope(),
    -- starter.sections.builtin_commands(),
    -- starter.sections.builtin_keys(),
    -- starter.sections.builtin_plugins(),
  },
})
