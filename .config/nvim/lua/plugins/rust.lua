return {
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require("rust-tools")
      rt.setup({
        autoSetHints = false,
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      local crates = require("crates")
      crates.setup()
    end,
  },
}
