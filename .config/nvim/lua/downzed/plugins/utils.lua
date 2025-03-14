return {
  'ThePrimeagen/vim-be-good',
  'tpope/vim-surround',
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      local wk = require('which-key')
      wk.add({
        {
          '<leader>b',
          group = 'Buffers',
          expand = function()
            return require('which-key.extras').expand.buf()
          end,
        },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>w', group = 'Workspace' },
        { '<leader>t', group = 'Toggle' },
        { '<leader>g', group = 'Git' },
        { '<leader>n', group = 'Neorg' },
        { '<leader>x', group = 'Diagnostics' },
      })
    end,
  },
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
  {
    'folke/todo-comments.nvim',
    opts = {},
  },
  {
    'folke/zen-mode.nvim',
    opts = {},
    config = function()
      vim.keymap.set(
        'n',
        '<leader>tz',
        require('zen-mode').toggle,
        { desc = '[T]oggle [Z]en mode' }
      )
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    opts = {},
  },
}
