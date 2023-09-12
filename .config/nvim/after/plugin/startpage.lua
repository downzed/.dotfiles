local startpage = require('alpha')
local themeConfig = require('alpha.themes.startify').config
startpage.setup(themeConfig)
vim.keymap.set('n', '<leader>A', ':Alpha<cr>')
