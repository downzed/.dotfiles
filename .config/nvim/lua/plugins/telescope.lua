
return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require("telescope")

      telescope.setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }

      telescope.load_extension('ui-select')
    end
  },
}
