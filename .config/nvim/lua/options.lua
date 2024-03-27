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
vim.opt.cursorline = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

vim.o.cmdheight = 0
vim.cmd.set('noswapfile')

-- fold
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'


vim.keymap.set('n', '<leader><leader>', ':nohlsearch<CR>')
vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })

local function closeAllBuffers()
  local buffers = vim.api.nvim_list_bufs()
  for _, buffer in ipairs(buffers) do
    if buffer ~= vim.api.nvim_get_current_buf() then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end
end

vim.keymap.set('n', '<leader>bD', function() closeAllBuffers() end, { desc = '[B]uffer [D]elete all but current' })

vim.keymap.set('n', '<leader>bd', ':bdelete<cr>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = '[B]uffer [P]revious' })

vim.keymap.set('n', '<leader>q', ':q<cr>', { desc = '[Q]uit' })
