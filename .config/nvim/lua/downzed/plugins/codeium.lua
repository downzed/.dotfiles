return {
  {
    'Exafunction/codeium.vim',
    -- event = 'BufEnter',
    config = function()
      vim.g.codeium_disable_bindings = 1

      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-a>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true, silent = true })
      vim.keymap.set('n', '<leader>tc', function()
        vim.cmd('CodeiumToggle')
      end, { expr = true, silent = true, desc = 'Toggle [C]odeium' })
    end,
  },
}
