return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      { "junegunn/fzf", build = "./install --bin" },
    },
    config = function()
      local fzf_lua = require("fzf-lua")
      local wk = require("which-key")

      -- calling `setup` is optional for customization
      fzf_lua.setup({})

      wk.register({
        name = "Fzf Lua:",
        ["th"] = { fzf_lua.colorschemes, "[Th]eme" },
        ["ht"] = { fzf_lua.helptags, "[H]elp [T]ags" },

        ["of"] = { fzf_lua.oldfiles, "[O]ld [F]iles" },
        ["pws"] = { fzf_lua.grep_cword, "[P]roject [W]ord (word)" },
        ["pWs"] = { fzf_lua.grep_cWORD, "[P]roject [W]ord (expression)" },
      }, { prefix = "<leader>" })

      wk.register({
        name = "Fzf Lua:",
        ["<C-p>"] = { fzf_lua.files, "Find Files" },
        ["<C-f>"] = {
          function()
            fzf_lua.grep_project({ search = vim.fn.input("Grep > ") })
          end, "Live Grep"
        }
      })

      local function closeAllBuffers()
        local buffers = vim.api.nvim_list_bufs()
        for _, buffer in ipairs(buffers) do
          if buffer ~= vim.api.nvim_get_current_buf() then
            vim.api.nvim_buf_delete(buffer, { force = true })
          end
        end
      end

      wk.register({
        b = {
          name = "[B]uffers: ",
          f = { fzf_lua.buffers, "Buffer list" },
          d = { ":bdelete<cr>", "Delete" },
          D = { closeAllBuffers, "Delete all but current" },
          n = { ":bnext<cr>", "Next" },
          p = { ":bprevious<cr>", "Previous" },
        }
      }, { prefix = "<leader>" })
    end
  }
}
