return {
  "alexghergh/nvim-tmux-navigation",
  "ThePrimeagen/vim-be-good", -- practive vim
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "RRethy/vim-illuminate",
  {
    "folke/twilight.nvim",
    "folke/zen-mode.nvim",
  },
  {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
