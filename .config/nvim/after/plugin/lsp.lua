local lsp = require('lsp-zero').preset({})
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

lsp.preset('recommended')
lsp.nvim_workspace()

local servers = {
  "tsserver",
  "eslint",
  "lua_ls",
  "bashls",
  "pyright",
  "rust_analyzer"
}

lsp.nvim_workspace()
lsp.ensure_installed(servers)


lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp.default_keymaps(opts)

  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
end)

lsp.skip_server_setup({ 'rust_analyzer' })

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

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
  print("eslintrc > provided")
  return not vim.tbl_isempty(eslintrc)
end

lspconfig.eslint.setup({
  single_file_support = false,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    lsp.default_keymaps(opts)

    if not eslint_config_exists() then
      return nil
    end

    vim.keymap.set('n', '<leader>f', ':EslintFixAll<cr>', opts)

    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.code_action, opts)
  end,
  settings = {
    packageManager = "yarn",
  }
})

vim.diagnostic.config({
  signs = true
})

lsp.setup()
