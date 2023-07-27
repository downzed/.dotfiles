local ng = require('neogit')
local gs = require('gitsigns')

ng.setup {
  kind = 'split'
}

gs.setup {
  signs = {
    add = { text = '+' },
    change = { text = '|' },
    delete = { text = '-' },
    topdelete = { text = ' ̅' },
    changedelete = { text = '~' },
    untrack = { text = '·' },
  },
}


vim.keymap.set('n', '<leader>gs', ':Neogit<CR>')
