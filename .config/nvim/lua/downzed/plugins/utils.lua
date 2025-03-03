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
    'norcalli/nvim-colorizer.lua',
    opts = {},
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      on_open = function()
        vim.api.nvim_set_hl(0, 'ZenBg', { bg = 'NONE' })
      end,
    },
    config = function(_, opts)
      require('zen-mode').setup(opts)

      vim.keymap.set('n', '<leader>tz', function()
        require('zen-mode').toggle()
      end, { desc = 'Toggle [Z]enMode' })
    end,
  },
}
