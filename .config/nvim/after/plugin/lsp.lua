local lsp = require('lsp-zero').preset({})
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

lsp.preset('recommended')
lsp.nvim_workspace()

local servers = {
  "tsserver",
  "eslint",
  "lua_ls",
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
  -- vim.keymap.set('n', 'K', '<cmd>Telescope lsp_hover<cr>', opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)

  -- lsp.async_autoformat(client, bufnr)
end)

lsp.skip_server_setup({ 'rust_analyzer' })

lsp.format_on_save({
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['pyright'] = { 'python' },
    ['eslint'] = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
  }
})

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
  if not vim.tbl_isempty(eslintrc) then
    print("eslint rc provided..")
    return true
  end
  return false
end

lspconfig.eslint.setup({
  single_file_support = false,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  on_attach = function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat(client, bufnr)

    if not eslint_config_exists() then
      return nil
    end

    lsp.async_autoformat(client, bufnr)
    vim.keymap.set('n', '<leader>f', '<cmd>EslintFixAll<cr>', { buffer = bufnr })
  end,
  settings = {
    packageManager = "yarn",
  }
})

vim.diagnostic.config({
  signs = true
})

lsp.setup()
