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
