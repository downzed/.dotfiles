vim.g.codeium_disable_bindings = 1
local opts = { expr = true }

vim.keymap.set('i', '<C-A>', function() return vim.fn['codeium#Accept']() end, opts)
vim.keymap.set('i', '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, opts)
vim.keymap.set('i', '<c-s-n>', function() return vim.fn['codeium#CycleCompletions'](-1) end, opts)
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, opts)
