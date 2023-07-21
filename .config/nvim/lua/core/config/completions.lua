local cmp = require('cmp')
local luasnip = require('luasnip')
local luasnip_vscode = require('luasnip.loaders.from_vscode')

luasnip_vscode.lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),

  }),

  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }
    },
    {
      { name = 'buffer' },
    }
  )
})

vim.g.codeium_disable_bindings = 1
local opts = { expr = true }
vim.keymap.set('i', '<TAB>', function() return vim.fn['codeium#Accept']() end, opts)
vim.keymap.set('i', '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, opts)
vim.keymap.set('i', '<c-s-n>', function() return vim.fn['codeium#CycleCompletions'](-1) end, opts)
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, opts)
