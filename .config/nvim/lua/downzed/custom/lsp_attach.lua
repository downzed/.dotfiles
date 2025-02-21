local attach = function(buffer, client)
  local navic = require('nvim-navic')
  local ts_builtin = require('telescope.builtin')

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, buffer)
  end

  vim.keymap.set(
    { 'n', 'i' },
    '<C-h>',
    vim.lsp.buf.signature_help,
    { desc = 'LSP: Signature Help' }
  )

  --- @param keys string representing the key sequence to be mapped.
  --- @param func function function to be executed when the key sequence is pressed.
  --- @param desc string string describing the key mapping.
  --- @usage map("<leader>xx", function() ... end, "[X]xx")
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, {
      buffer = buffer,
      desc = 'LSP: ' .. desc,
    })
  end

  map('<leader>ds', ts_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', ts_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- map('K', vim.lsp.buf.hover, 'Hover Documentation')

  map('gd', ts_builtin.lsp_definitions, '[G]oto [D]efinition')
  map('gI', ts_builtin.lsp_implementations, '[G]oto [I]mplementation')
  map('gr', ts_builtin.lsp_references, '[G]oto [R]eferences')
  map('gD', ts_builtin.lsp_type_definitions, '[G]oto Type [D]efinition')
  -- map('gD', ts_builtin.lsp_declarations, '[G]oto [D]eclaration')
  -- map('<leader>D', ts_builtin.lsp_type_definitions, '[G]oto Type [D]efinition')
  map('<leader>xf', vim.diagnostic.open_float, 'Diagnostics: [F]loat')

  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    map('<leader>th', function()
      local is_enabled = vim.lsp.inlay_hint.is_enabled()
      print('Inlay hints: ' .. (is_enabled and 'enabled' or 'disabled'))
      vim.lsp.inlay_hint.enable(not is_enabled)
    end, '[T]oggle Inlay [H]ints')
  end

  vim.diagnostic.config({
    virtual_text = false,
    underline = true,
  })

  ---@description toggle virtual text
  map('<leader>tv', function()
    local is_enabled = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not is_enabled })
  end, '[T]oggle [V]irtual text')

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
    style = 'minimal',
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('DownzedLspConfig', {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    attach(ev.buf, client)
  end,
})
