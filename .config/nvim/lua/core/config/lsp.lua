require("mason").setup()

local mason_lsp = require("mason-lspconfig")

local servers = {
  "lua_ls",
  "pyright",
  "rust_analyzer",
}

mason_lsp.setup({
  ensure_installed = servers
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function()

  local tsbuiltin = require('telescope.builtin')

  vim.keymap.set("n", "gd", tsbuiltin.lsp_definitions, {})
  vim.keymap.set("n", "grf", tsbuiltin.lsp_references, {})

  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {})

  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})

  vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
  --vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, {})
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
end

for _, lsp in pairs(servers) do
  if lsp == 'lua_ls' then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

-- lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {}
