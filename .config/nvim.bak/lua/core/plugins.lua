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

  ---- start page
  use {
    'goolord/alpha-nvim',
    requires = { { 'nvim-tree/nvim-web-devicons' } }
  }

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

  use 'nvim-tree/nvim-tree.lua'
  use 'folke/which-key.nvim'

  -- git
  use 'tpope/vim-fugitive'

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  -- code tools
  use 'RRethy/vim-illuminate' -- highlight keyword
  use 'tpope/vim-commentary'  -- comment/uncomments
  use 'Exafunction/codeium.vim'

  -- snippet engine
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-buffer'

  -- rust tools
  use 'simrat39/rust-tools.nvim'

  -- status lines
  use 'nvim-lualine/lualine.nvim'
  use 'arkav/lualine-lsp-progress'

  -- theme
  use 'EdenEast/nightfox.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
--local plugins = {

---- start page
--{
--'goolord/alpha-nvim',
--dependencies = { 'nvim-tree/nvim-web-devicons' },
--},

---- status lines
--'nvim-lualine/lualine.nvim',
--{
--'akinsho/bufferline.nvim',
--dependencies = 'nvim-tree/nvim-web-devicons'
--},

---- files
--'nvim-tree/nvim-tree.lua',
--{
--'nvim-treesitter/nvim-treesitter',
--run = ':TSUpdate'
--},
--{
--'nvim-telescope/telescope.nvim',
--tag = '0.1.1',
--dependencies = { { 'nvim-lua/plenary.nvim' } }
--},

---- code helpers
--'Exafunction/codeium.vim',
--'preservim/nerdcommenter',

---- vim tools
--{
--'folke/which-key.nvim',
--config = function()
--vim.o.timeout = true
--vim.o.timeoutlen = 300
--end
--},

---- theme
--'Th3Whit3Wolf/one-nvim',
--'whatyouhide/vim-gotham',
--'nvim-tree/nvim-web-devicons',
--}
