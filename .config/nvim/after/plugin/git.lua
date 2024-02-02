local gs = require('gitsigns')

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


vim.keymap.set('n', '<leader>gst', ":Gitsigns toggle_current_line_blame<CR>", { desc = 'Toggle current line blame' })
vim.keymap.set('n', '<leader>gsp', ":Gitsigns preview_hunk<CR>", { desc = 'Preview hunk' })
-- vim.keymap.set('n', '<leader>gts', ":Gitsigns stage_hunk<CR>", { desc = 'Stage hunk' })
-- vim.keymap.set('n', '<leader>gtu', ":Gitsigns undo_stage_hunk<CR>", { desc = 'Undo stage hunk' })
