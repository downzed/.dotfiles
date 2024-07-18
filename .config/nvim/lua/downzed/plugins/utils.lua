return {
  "alexghergh/nvim-tmux-navigation",
  "ThePrimeagen/vim-be-good",
  "tpope/vim-surround",
  "folke/zen-mode.nvim",
  {
    "danymat/neogen",
    opts = {}
  },

  {
    'folke/which-key.nvim',
    event = "VimEnter",
    config = function()
      local wk = require("which-key")
      wk.add({
        {
          '<leader>b',
          group = 'Buffers',
          expand = function()
            return require('which-key.extras').expand.buf()
          end
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
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown',                                                       -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    opts = {}
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
