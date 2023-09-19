-- Function to close all buffers except the current one
local function closeAllBuffers()
  local buffers = vim.api.nvim_list_bufs()
  for _, buffer in ipairs(buffers) do
    if buffer ~= vim.api.nvim_get_current_buf() then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end
end

-- function to find & replace word under cursor
local function find_and_replace()
  local search = vim.fn.expand("<cword>")
  local replace = vim.fn.input("Replace with: ")
  vim.cmd(":%s/" .. search .. "/" .. replace .. "/g")
end

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })
vim.keymap.set('n', '<leader>E', 'Y%', { remap = true, desc = 'Go to matching pair' })

vim.keymap.set('n', '<leader>bd', ':bdelete<cr>', { desc = 'delete buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = 'next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = 'previous buffer' })
vim.keymap.set('n', '<leader>bD', function() closeAllBuffers() end, { desc = 'close all buffers except the current one' })
vim.keymap.set('n', '<C-S-R>', function() find_and_replace() end, { desc = 'find and replace word under cursor' })
