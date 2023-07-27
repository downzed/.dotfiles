vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- files & navigation
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- git
  use 'lewis6991/gitsigns.nvim'
  use {
    'NeogitOrg/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- lsp (language server protocols)
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  -- rust
  use 'simrat39/rust-tools.nvim'

  -- ai completion
  use 'Exafunction/codeium.vim'

  -- code tools
  use 'RRethy/vim-illuminate' -- highlight keyword
  use 'tpope/vim-commentary'  -- comment/uncomments
  use 'folke/which-key.nvim'

  -- tmux
  use 'christoomey/vim-tmux-navigator'

  -- start page
  use 'goolord/alpha-nvim'

  -- status
  use 'nvim-lualine/lualine.nvim'

  -- theme
  use 'EdenEast/nightfox.nvim'
  use 'nvim-tree/nvim-web-devicons'
end)
