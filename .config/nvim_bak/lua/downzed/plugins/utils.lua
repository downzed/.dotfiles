return {
  "alexghergh/nvim-tmux-navigation",
  "ThePrimeagen/vim-be-good",
  "tpope/vim-surround",
  "folke/zen-mode.nvim",
  {
    "danymat/neogen",
    opts = {}
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  {
    'folke/which-key.nvim',
    event = "VimEnter",
    config = function()
      local wk = require("which-key")
      wk.add({
        { '<leader>b', group = 'Buffers' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>w', group = 'Workspace' },
        { '<leader>t', group = 'Toggle' },
        { '<leader>g', group = 'Git' },
        { '<leader>n', group = 'Neorg' },
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
    -- config = function()
    --   require('render-markdown').setup({})
    -- end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
