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
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' }
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
  'lewis6991/gitsigns.nvim',
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  -- test
  'klen/nvim-test',

  -- rust
  'simrat39/rust-tools.nvim',

  -- code tools
  'RRethy/vim-illuminate', -- highlight keyword
  'tpope/vim-commentary',  -- comment/uncomments
  'folke/which-key.nvim',

  -- start page
  'goolord/alpha-nvim',
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    -- config = function()
    --   require('dashboard').setup {
    --     -- config
    --   }
    -- end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  -- file tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    }
  },

  -- notes
  {
    'phaazon/mind.nvim',
    branch = 'v2.2',
    requires = { 'nvim-lua/plenary.nvim' },
  },

  -- ui, notifications & messages
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  -- status
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
  'EdenEast/nightfox.nvim',
  { 'rose-pine/neovim', name = 'rose-pine' },
  'nvim-tree/nvim-web-devicons',
}

require("lazy").setup(plugins)
