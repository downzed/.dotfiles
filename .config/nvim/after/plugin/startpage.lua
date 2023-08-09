local startpage = require('alpha')
local themeConfig = require('alpha.themes.startify').config
startpage.setup(themeConfig)
vim.keymap.set('n', '<leader>A', ':Alpha<cr>')

-- local startpage = require('mini.starter')
-- startpage.setup()

-- vim.keymap.set('n', '<leader>A', ':lua MiniStarter.open()<cr>')
-- vim.keymap.set('n', '<leader>a', ':lua MiniStarter.close()<cr>')
