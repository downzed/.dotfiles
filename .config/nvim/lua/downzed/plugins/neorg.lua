return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true,   -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    -- put any other flags you wanted to pass to lazy here!
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Add pretty icons to your documents
          ["core.ui"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Developer/notes",
                c = "~/Developer/notes/c",
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
