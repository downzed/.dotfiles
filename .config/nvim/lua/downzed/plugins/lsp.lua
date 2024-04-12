return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "j-hui/fidget.nvim",
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      require('neodev').setup({})
      require('fidget').setup({})

      local cmp_lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local vim_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
      vim_lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true
      vim_lsp_capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          'documentation',
          'detail',
          'additionalTextEdits',
        }
      }
      local capabalities = vim.tbl_deep_extend(
        'force',
        {},
        vim_lsp_capabilities,
        cmp_lsp_capabilities
      )

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "bashls",
          "eslint"
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabalities
            })
          end,
          ["tsserver"] = function()
            require("lspconfig").tsserver.setup {
              capabilities = capabalities,
            }
          end,

          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup {
              capabilities = capabalities,
              settings = {
                Lua = {
                  completion = {
                    callSnippet = "Replace"
                  }
                }
              }
            }
          end,
        }
      })

      vim.diagnostic.config({
        virtual_text = true
      })
    end,
  }
}
