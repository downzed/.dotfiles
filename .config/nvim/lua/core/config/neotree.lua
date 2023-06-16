-- neo tree
vim.g.laoded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('neo-tree').setup()

vim.keymap.set('n', '<leader>e', ':NeoTreeRevealToggle<CR>')
