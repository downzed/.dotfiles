vim.keymap.set('n', '<leader>e', ':Neotree position=current reveal=true toggle<CR>')
-- vim.keymap.set('n', '<leader>bf', ':Neotree toggle source=buffers position=bottom<CR>')

require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enable = true
    }
  }
  -- source_selector = {
  --   winbar = false,
  --   statusline = false
  -- }
})
