local rust_tools = require('rust-tools')
local rt_options = {
  tools = {
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      auto = true
    }
  },
  servers = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<leader>vca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
    end
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy"
      }
    }
  }
}
rust_tools.setup(rt_options)
