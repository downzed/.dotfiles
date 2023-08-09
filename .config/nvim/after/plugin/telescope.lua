local telescope = require('telescope')
local builtin = require('telescope.builtin')
local theme = {
  hidden = true,
  theme = 'ivy'
}

telescope.setup({
  pickers = {
    find_files = theme,
    grep_string = theme,
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

vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', function()
  builtin.grep_string({ search = vim.fn.input("keyword >> ") })
end)
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
vim.keymap.set('n', '<leader>gp', builtin.lsp_document_symbols, {})
