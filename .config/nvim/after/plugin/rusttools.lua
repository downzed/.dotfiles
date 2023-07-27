local rust_tools = require('rust-tools')

rust_tools.setup({
  server = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "ca", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
      vim.keymap.set("n", "gd", rust_tools.goto_definition.goto_definition, { buffer = bufnr })
    end,
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
})
