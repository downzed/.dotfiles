local attach = function(buffer, client)
  local check_is_not_eslint = function()
    return vim.fn.filereadable(vim.fn.getcwd() .. "/.eslintrc.*") == 0 and client.name ~= "eslint"
  end

  local options = {
    buffer = buffer,
    remap = false,
    noremap = true,
    silent = true
  }

  local is_not_eslint = check_is_not_eslint()
  local fmt_cmd = is_not_eslint and ":lua vim.lsp.buf.format()<cr>" or ":EslintFixAll<cr>"

  local wk = require("which-key")
  wk.register({
    s = {
      name = "[S]ymbols",
      d = { require('telescope.builtin').lsp_document_symbols, "[D]ocument" },
      w = { require('telescope.builtin').lsp_dynamic_workspace_symbols, "[W]orkspace" }
    },
    d = {
      name = "[D]iagnostics",
      --   d = { vim.diagnostic.open_float, "[D]iagnostic [D]iagnostics" },
      ["]"] = { vim.diagnostic.goto_next, "Next" },
      ["["] = { vim.diagnostic.goto_prev, "Previous" }
    },
    c = {
      name = "[C]ode",
      a = { vim.lsp.buf.code_action, "[A]ction" },
    },
    f = { fmt_cmd, "[F]ormat" },
    ["rn"] = { vim.lsp.buf.rename, "[R]e[n]ame" },

  }, vim.tbl_deep_extend('force', {}, { prefix = "<leader>" }, options))

  wk.register({
    g = {
      name = "[G]o to",
      d = { require('telescope.builtin').lsp_definitions, "[D]efinition" },
      r = { require('telescope.builtin').lsp_references, "[R]eferences" },
      I = { require('telescope.builtin').lsp_implementations, "[I]mplementation" },
      t = { require('telescope.builtin').lsp_type_definitions, "[T]ype definition" },
    },
    K = { vim.lsp.buf.hover, "Hover" },
    ["<C-h>"] = { vim.lsp.buf.signature_help, "Signature Help" },
  }, options)

  wk.register({
    ["<C-h>"] = { vim.lsp.buf.signature_help, "Signature Help" },
  }, vim.tbl_deep_extend('force', {}, { mode = "i" }, options))

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    command = check_is_not_eslint() and "lua vim.lsp.buf.format()" or "EslintFixAll"
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("DownzedLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    attach(ev.buf, client)
  end,
})
