vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.termguicolors = true
vim.opt.encoding = 'utf-8'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
-- vim.opt.cursorline = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

vim.o.cmdheight = 0
-- completion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
-- fold
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.cmd.set('noswapfile')