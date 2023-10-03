local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local lsp_progress = require('lsp-progress')
local masonconfig = require('mason-lspconfig')
local mason = require('mason')
local cmp = require('cmp')

lsp.preset('recommended')

local servers = {
  "tsserver",
  "eslint",
  "lua_ls",
  "bashls",
  "pyright",
  "rust_analyzer"
}

mason.setup({
  ui = {
    icons = {
      package_installed = "",
      package_pending = "󰚰",
      package_uninstalled = "",
    },
  }
})

masonconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      lspconfig.lua_ls.setup(lua_opts)
    end,
  },
})

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
  return not vim.tbl_isempty(eslintrc)
end

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp.default_keymaps(opts)

  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.code_action, opts)

  if not eslint_config_exists() then
    lsp.buffer_autoformat()
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
  else
    vim.keymap.set('n', '<leader>f', ':EslintFixAll<cr>', opts)
  end
end

lsp.on_attach(on_attach)

lsp.format_on_save({
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['pyright'] = { 'python' },
    ['eslint'] = {
      'javascript.js',
      'javascript.jsx',
      'javascriptreact',
      'javascript',
      'typescript',
      'typescript.ts',
      'typescript.tsx',
      'typescriptreact'
    },
  }
})

vim.diagnostic.config({
  signs = true
})

cmp.setup({
  formatting = lsp.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    -- accept first option
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'crates' },
    { name = 'nvim_lsp_references' },
  }
})

lsp.setup()
lsp_progress.setup()
