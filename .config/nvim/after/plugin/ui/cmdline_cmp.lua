local cmp = require('cmp')

local config = {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  }
}

cmp.setup.cmdline('/', config)
cmp.setup.cmdline('?', config)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man' }
      }
    }
  })
})
