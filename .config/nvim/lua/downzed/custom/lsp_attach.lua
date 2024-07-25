local attach = function(buffer, client)
  local navic = require("nvim-navic")
  local fzf_lua = require("fzf-lua")

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, buffer)
  end

  --- @param keys string representing the key sequence to be mapped.
  --- @param func function function to be executed when the key sequence is pressed.
  --- @param desc string string describing the key mapping.
  --- @usage map("<leader>xx", function() ... end, "[X]xx")
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, {
      buffer = buffer,
      desc = 'LSP: ' .. desc
    })
  end

  vim.keymap.set({ 'n', 'i' }, "<C-h>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Help" })

  map("<leader>ds", fzf_lua.lsp_document_symbols, "[D]ocument [S]ymbols")
  map("<leader>ws", fzf_lua.lsp_live_workspace_symbols, "[W]orkspace [S]ymbols")

  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>ca", fzf_lua.lsp_code_actions, "[C]ode [A]ction")

  map("K", vim.lsp.buf.hover, "Hover Documentation")

  map("gd", fzf_lua.lsp_definitions, "[G]oto [D]efinition")
  map("gI", fzf_lua.lsp_implementations, "[G]oto [I]mplementation")
  map("gr", fzf_lua.lsp_references, "[G]oto [R]eferences")
  map("gD", fzf_lua.lsp_declarations, "[G]oto [D]eclaration")
  map("<leader>D", fzf_lua.lsp_typedefs, "[G]oto Type [D]efinition")

  -- The following autocommand is used to enable inlay hints in your
  -- code, if the language server you are using supports them
  --
  -- This may be unwanted, since they displace some of your code
  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(true)
    end, '[T]oggle Inlay [H]ints')
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("DownzedLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    attach(ev.buf, client)
  end,
})
