return {
  {
    -- my very first WIP plugin
    -- https://github.com/downzed/meine-schnecke.nvim
    -- "downzed/meine-schnecke.nvim",
    -- personal oc dir
    dir = "~/Developer/lua/die-schnecke.nvim",
    -- macbook pro dir
    dependencies = {
      "grapp-dev/nui-components.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local schnecke = require("die-schnecke")
      schnecke.setup({})
    end
  },
}
