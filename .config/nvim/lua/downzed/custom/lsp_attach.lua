local attach = function(buffer, client)
  local navic = require("nvim-navic")

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, buffer)
  end

  -- local check_is_not_eslint = function()
  --   return vim.fn.filereadable(vim.fn.getcwd() .. "/.eslintrc.*") == 0 and client.name ~= "eslint"
  -- end

  -- local is_not_eslint = check_is_not_eslint()
  -- local fmt_cmd = is_not_eslint and ":lua vim.lsp.buf.format()<cr>" or ":EslintFixAll<cr>"

  local fzf_lua = require("fzf-lua")

  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, {
      buffer = buffer,
      desc = 'LSP: ' .. desc
    })
  end

  -- vim.keymap.set({ 'n', 'i' }, "<C-h>", vim.lsp.buf.signature_help, "LSP: Signature Help")

  map("<leader>ds", fzf_lua.lsp_document_symbols, "[D]ocument [S]ymbols")
  map("<leader>ws", fzf_lua.lsp_live_workspace_symbols, "[W]orkspace [S]ymbols")
  --
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>ca", fzf_lua.lsp_code_actions, "[C]ode [A]ction")

  map("K", vim.lsp.buf.hover, "Hover Documentation")
  --
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
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
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
