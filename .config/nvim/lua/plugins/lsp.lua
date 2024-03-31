local function attach(buffer, client)
  local check_is_not_eslint = function()
    return vim.fn.filereadable(vim.fn.getcwd() .. "/.eslintrc.js") == 0 and client.name ~= "eslint"
  end

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

  map("gd", require('telescope.builtin').lsp_definitions, "[G]oto [D]efinition")
  map("gr", require('telescope.builtin').lsp_references, "[G]oto [R]eferences")
  map("gI", require('telescope.builtin').lsp_implementations, "[G]oto [I]mplementation")
  map("<leader>td", require('telescope.builtin').lsp_type_definitions, "[T]ype definition")
  map("K", vim.lsp.buf.hover, "Hover")

  -- best keymap for signature_help
  vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help,
    { buffer = buffer, silent = true, desc = "Signature Help" })

  -- ESlint or Default format
  local isNotEslint = check_is_not_eslint()
  if isNotEslint then
    map("<leader>f", vim.lsp.buf.format, "[F]ormat")
  else
    map("<leader>f", ":EslintFixAll<cr>", "[E]slint [F]ormat")
  end

  local command = isNotEslint and "lua vim.lsp.buf.format()" or "EslintFixAll"

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    command = command
  })
end

return {
  { "folke/neodev.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      require('neodev').setup({})
      require('fidget').setup({})

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
          "bashls",
          "eslint"
        },
        automatic_installation = true,
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
          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          attach(ev.buf, client)
        end,
      })

      vim.diagnostic.config({
        virtual_text = true
      })
    end,
  }
}
