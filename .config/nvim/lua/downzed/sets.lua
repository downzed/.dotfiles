vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true
vim.opt.encoding = 'utf-8'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.cursorline = true

-- use spaces for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.diffopt = "iwhite" -- Add ignorance of whitespace to diff
vim.opt.wildmenu = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

vim.opt.clipboard = 'unnamedplus'
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
vim.o.cmdheight = 0
vim.cmd.set('noswapfile')
