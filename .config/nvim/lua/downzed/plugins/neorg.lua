return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    -- put any other flags you wanted to pass to lazy here!
    config = function()
      local user = os.getenv("USER") or os.getenv("USERNAME")
      local default_ws = user == "ziv.zerr" and "work" or "notes"

      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Add pretty icons to your documents
          ["core.ui"] = {},
          ["core.export"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Developer/notes",
                c = "~/Developer/notes/c",
                ["data-strcutures"] = "~/Developer/notes/data-structures",
                work = user == "ziv.zerr" and "~/Developer/work/notes" or nil,
              },
              default_workspace = default_ws,
            },
          },
        },
      })

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
