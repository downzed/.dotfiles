return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
      -- vim.g.codeium_disable_bindings = 1

      -- local map = function(lhs, rhs, desc)
      --   local set = vim.keymap.set
      --   local opts = { expr = true, desc = "[Codeium]: " .. desc }
      --   set("i", lhs, rhs, opts)
      -- end

      -- map("<c-a>", function() return vim.fn["codeium#Accept"]() end, "Accept")
      -- map("<c-x>", function() return vim.fn["codeium#Clear"]() end, "Clear")
      -- map("<c-j>", function() return vim.fn["codeium#CycleCompletions"](1) end, "Next Completion")
      -- map("<c-k>", function() return vim.fn["codeium#CycleCompletions"](-1) end, "Previous Completion")
    end
  },
}
