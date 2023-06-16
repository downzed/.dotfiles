local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- files & navigation
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    }
  }

  -- git
  use 'tpope/vim-fugitive'

  -- syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- lsp (language server protocols)
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- completion & snippets
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'rafamadriz/friendly-snippets' -- vscode like completion
  use 'Exafunction/codeium.vim'      -- ai completion

  -- lua
  use {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  }

  -- rust
  use 'simrat39/rust-tools.nvim'

  -- code tools
  use 'RRethy/vim-illuminate' -- highlight keyword
  use 'tpope/vim-commentary'  -- comment/uncomments
  use 'folke/which-key.nvim'

  -- start page
  use 'goolord/alpha-nvim'

  -- status
  use 'nvim-lualine/lualine.nvim'

  -- theme
  use 'EdenEast/nightfox.nvim'
  use 'nvim-tree/nvim-web-devicons'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
