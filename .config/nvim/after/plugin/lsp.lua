local lsp = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')

lsp.preset('recommended')
lsp.nvim_workspace()

local servers = {
  "tsserver",
  "lua_ls",
  "pyright",
  "rust_analyzer",
}

lsp.ensure_installed(servers)

local on_attach = function(_client, bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local _tsbuiltin = require('telescope.builtin')
  lsp.default_keymaps({ buffer = bufnr })
end

lsp.on_attach(on_attach)
lsp.skip_server_setup({ 'rust_analyzer' })
lsp.format_on_save({
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' }
  }
})

vim.diagnostic.config({
  signs = true
})

lsp.setup()
