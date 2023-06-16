require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "tsserver",
    "pyright",
    "rust_analyzer",
    "vimls",
    "bashls"
  }
}

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { })

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { })
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { })
end
local capapabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capapabilities = capapabilities,
}

require("lspconfig").html.setup {
  on_attach = on_attach,
}

require("lspconfig").cssls.setup {
  on_attach = on_attach,
}

require("lspconfig").tsserver.setup {
  on_attach = on_attach,
}

require("lspconfig").pyright.setup {
  on_attach = on_attach,
}
require("lspconfig").rust_analyzer.setup {
  on_attach = on_attach,

}

require("lspconfig").vimls.setup {
  on_attach = on_attach,
}

require("lspconfig").bashls.setup {
  on_attach = on_attach,
}

