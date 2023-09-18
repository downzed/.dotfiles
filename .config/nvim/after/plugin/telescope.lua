local telescope = require('telescope')
local builtin = require('telescope.builtin')
local theme = {
  hidden = true,
}

telescope.setup({
  defaults = {
    winblend = 8
  },
  pickers = {
    find_files = theme,
    grep_string = theme,
    oldfiles = theme,
    git_files = theme,
    buffers = theme,
    colorscheme = {
      enable_preview = true,
      on_change = function(colorscheme)
        SetColorscheme(colorscheme)
      end
    }
  }
})
local config = {
  cwd_only = true,
  hidden = true,
  sort_last = true,
}


vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Find git files' })
vim.keymap.set('n', '<leader>ff', function() builtin.find_files(config) end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>of', function() builtin.oldfiles(config) end, { desc = 'Open oldfiles' })
vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Open buffers' })

vim.keymap.set('n', '<leader>gp', builtin.lsp_document_symbols, { desc = 'Show document symbols' })
vim.keymap.set('n', '<C-f>', function()
  builtin.grep_string({ search = vim.fn.input("keyword >> ") })
end, { desc = 'Grep string' })
