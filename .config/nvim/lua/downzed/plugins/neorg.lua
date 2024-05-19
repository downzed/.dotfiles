return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Add pretty icons to your documents
          ["core.ui"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Developer/notes",
              },
              default_workspace = "notes",
            },
          }
        }
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  }
}
