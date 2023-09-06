vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })
vim.keymap.set('n', '<leader>E', 'Y%', { remap = true, desc = 'Go to matching pair' })
vim.keymap.set('n', '<leader>bd', ':bdelete<cr>', { desc = 'delete buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = 'next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = 'previous buffer' })

-- Function to close all buffers except the current one
local function closeAllBuffers()
  local buffers = vim.api.nvim_list_bufs()
  for _, buffer in ipairs(buffers) do
    if buffer ~= vim.api.nvim_get_current_buf() then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end
end

vim.keymap.set('n', '<leader>bD', function() closeAllBuffers() end, { desc = 'close all buffers except the current one' })
