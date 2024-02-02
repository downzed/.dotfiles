local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  'nvim-treesitter/nvim-treesitter-context',
  'alexghergh/nvim-tmux-navigation',

  -- lsp
  {
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },

    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- Autocompletion
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
  },

  -- Debugging
  {
    { 'mfussenegger/nvim-dap' },
    { 'nvim-lua/plenary.nvim' },
  },
  -- AI completion
  'Exafunction/codeium.vim',

  -- trouble
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- files & navigation
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
  },

  -- test
  'klen/nvim-test',

  -- rust
  {
    'rust-lang/rust.vim',
    'simrat39/rust-tools.nvim',
    {
      'saecki/crates.nvim',
      tag = 'v0.3.0',
      event = { "BufRead Cargo.toml" },
      dependencies = { 'nvim-lua/plenary.nvim' },
    }
  },

  -- vim/code tools
  'ThePrimeagen/vim-be-good', -- practive vim
  'RRethy/vim-illuminate',    -- highlight keyword
  'tpope/vim-commentary',     -- comment/uncomments
  'folke/which-key.nvim',
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  -- start page
  { 'echasnovski/mini.starter', version = '*' },

  -- file tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },

  -- ui, notifications & messages
  {
    {
      'stevearc/dressing.nvim',
      lazy = true,
    },
    {
      'rcarriga/nvim-notify',
      lazy = true,
      config = function()
        vim.notify = require("notify")
      end,
    },
    { "MunifTanjim/nui.nvim", lazy = true },
  },

  -- status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons',
        'linrongbin16/lsp-progress.nvim',
        opt = true
      }
    }
  },
  {
    'linrongbin16/lsp-progress.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- themes
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  'arcticicestudio/nord-vim',
  -- 'EdenEast/nightfox.nvim',
  { 'rose-pine/neovim',         name = 'rose-pine' },
  'nvim-tree/nvim-web-devicons',
}

require("lazy").setup(plugins)
