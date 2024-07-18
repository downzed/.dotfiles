vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.g.loaded_ruby_provider = 0

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
vim.opt.timeout = true
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.laststatus = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.cmdheight = 0
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.o.rtp = vim.o.rtp .. ',' .. "/opt/homebrew/bin/fzf"

-- fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.cmd.set('nofoldenable')

-- -- misc
vim.cmd.set('noswapfile')
-- vim.opt.shortmess:append({ I = true })
-- vim.opt.encoding = 'utf-8'
-- vim.opt.showcmd = true
-- vim.opt.autoread = true
-- vim.opt.autowrite = true
-- vim.opt.cursorline = false
