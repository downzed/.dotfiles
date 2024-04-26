local attach = function(buffer, client)
  local navic = require("nvim-navic")

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, buffer)
  end

  if vim.lsp.inlay_hint ~= nil and client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
  end

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

  local fzf_lua = require("fzf-lua")
  local wk = require("which-key")

  wk.register({
    s = {
      name = "[S]ymbols",
      d = { fzf_lua.lsp_document_symbols, "[D]ocument" },
      w = { fzf_lua.lsp_live_workspace_symbols, "[W]orkspace" }
    },
    d = {
      name = "[D]iagnostics",
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
      d = { function()
        fzf_lua.lsp_definitions({
          show_line = false,
        })
      end, "[D]efinition" },
      r = { fzf_lua.lsp_references, "[R]eferences" },
      I = { fzf_lua.lsp_implementations, "[I]mplementation" },
      t = { fzf_lua.lsp_type_definitions, "[T]ype definition" },
    },
    K = { vim.lsp.buf.hover, "Hover" },
    ["<C-h>"] = { vim.lsp.buf.signature_help, "Signature Help" },
  }, options)

  wk.register({
    ["<C-h>"] = { vim.lsp.buf.signature_help, "Signature Help" },
  }, vim.tbl_deep_extend('force', {}, { mode = "i" }, options))

  if check_is_not_eslint() then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = buffer,
      command = "lua vim.lsp.buf.format()"
    })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("DownzedLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    attach(ev.buf, client)
  end,
})
