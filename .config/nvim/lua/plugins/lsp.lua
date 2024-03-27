local function attach(buffer)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, {
      buffer = buffer,
      desc = 'LSP: ' .. desc,
      remap = false,
      noremap = true,
      silent = true
    })
  end


  map("<leader>ws", ":Telescope lsp_dynamic_workspace_symbols <cr>", "[W]orkspace [S]ymbols")
  map("<leader>ds", ":Telescope lsp_document_symbols<cr>", "[D]ocument [S]ymbols")
  map("<leader>od", vim.diagnostic.open_float, "[O]pen [D]iagnostic")
  map("<leader>d]", vim.diagnostic.goto_next, "Next ] [D]iagnostic")
  map("<leader>d[", vim.diagnostic.goto_prev, "Prev [ [D]iagnostic")

  map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>F", vim.lsp.buf.format, "[F]ormat")

  map("gd", require('telescope.builtin').lsp_definitions, "[G]oto [D]efinition")
  map("gr", require('telescope.builtin').lsp_references, "[G]oto [R]eferences")
  map("gI", require('telescope.builtin').lsp_implementations, "[G]oto [I]mplementation")
  map("<leader>td", require('telescope.builtin').lsp_type_definitions, "[T]ype definition")

  map("<C-h>", vim.lsp.buf.signature_help, "Signature Help")
  map("K", vim.lsp.buf.hover, "Hover")
end

return {
  { "folke/neodev.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require('neodev').setup({})

      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabalities = vim.lsp.protocol.make_client_capabilities()

      lsp_capabilities = vim.tbl_deep_extend('force', capabalities, lsp_capabilities)

      local lspconfig = require("lspconfig")

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "bashls"
        },
        handlers = {
          function(server)
            lspconfig[server].setup({
              capabilities = lsp_capabilities
            })
          end
        }
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("DownzedLspConfig", {}),
        callback = function(ev)
          attach(ev.buf)

          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = ev.buf,
            command = "lua vim.lsp.buf.format()"
          })
        end,
      })
    end,
  }
}
