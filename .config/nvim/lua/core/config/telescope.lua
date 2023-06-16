require('telescope').setup({
  pickers = {
    colorscheme = {
      enable_preview = true,
      on_change = function(colorscheme)
        SetColorscheme(colorscheme)
      end
    }
  }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<c-f>', function()
  builtin.grep_string({ search = vim.fn.input("Grep >> ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>bff', builtin.buffers, {})
