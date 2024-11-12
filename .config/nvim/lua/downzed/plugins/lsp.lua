return {
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            override_vim_notify = true, -- Automatically override vim.notify() with Fidget
            window = {
              normal_hl = "NormalFloat", -- Base highlight group in the notification window
              winblend = 45, -- Background color opacity in the notification window
              border = "none", -- Border around the notification window
              zindex = 45, -- Stacking priority of the notification window
              max_width = 0, -- Maximum width of the notification window
              max_height = 0, -- Maximum height of the notification window
              x_padding = 1, -- Padding from right edge of window boundary
              y_padding = 0, -- Padding from bottom edge of window boundary
              align = "bottom", -- How to align the notification window
              relative = "editor", -- What the notification window position is relative to
            },
          },
        },
      },
    },
    config = function()
      require("fidget").setup()

      local cmp_lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local vim_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
      vim_lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true
      vim_lsp_capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }
      local capabalities =
        vim.tbl_deep_extend("force", {}, vim_lsp_capabilities, cmp_lsp_capabilities)

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "eslint",
          "rust_analyzer",
          "clangd",
          "html",
          "cssls",
          "tailwindcss",
          "pyright",
          "pylsp",
          "jsonls",
          "yamlls",
          "marksman",
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabalities,
            })
          end,
          ["cssls"] = function()
            local validate = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            }
            require("lspconfig").cssls.setup({
              capabilities = capabalities,
              settings = {
                css = validate,
                scss = validate,
                less = validate,
              },
            })
          end,
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              capabilities = capabalities,
              settings = {
                Lua = {
                  runtime = {
                    version = "LuaJIT",
                  },
                  diagnostics = {
                    globals = { "vim" },
                  },
                  completion = {
                    callSnippet = "Replace",
                  },
                  telemetry = {
                    enable = false,
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
