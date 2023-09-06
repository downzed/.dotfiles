vim.keymap.set('n', '<leader>e', ':Neotree reveal=true toggle<CR>')
-- vim.keymap.set('n', '<leader>bf', ':Neotree toggle source=buffers position=bottom<CR>')

require("neo-tree").setup({
  -- source_selector = {
  --   winbar = false,
  --   statusline = false
  -- }
})
