return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      { "junegunn/fzf", build = "./install --bin" },
    },
    config = function()
      local fzf_lua = require("fzf-lua")

      -- calling `setup` is optional for customization
      fzf_lua.setup({
        oldfiles = {
          prompt                  = 'History❯ ',
          cwd_only                = true,
          stat_file               = true, -- verify files exist on disk
          include_current_session = true, -- include bufs from current session
        },
      })

      local map = function(keys, func, desc, use_desc)
        if use_desc == nil then use_desc = true end
        vim.keymap.set('n', keys, func, {
          desc = use_desc and "FZF: " .. desc or desc
        })
      end

      map("<leader>sf", fzf_lua.files, "[S]earch [F]iles")
      map("<leader>sg", fzf_lua.git_files, "[S]earch [G]it files")
      map("<leader>sh", fzf_lua.helptags, "[S]earch [H]elp")
      map("<leader>sk", fzf_lua.keymaps, "[S]earch [K]eymaps")
      map("<leader>so", fzf_lua.oldfiles, "[S]earch [O]ldfiles")
      map("<leader>sw", fzf_lua.grep_cword, "[S]earch [W]ord")
      map("<leader>sW", fzf_lua.grep_cWORD, "[S]earch [W]ord [E]xpression")
      map("<leader>scs", fzf_lua.colorschemes, "[S]earch [C]olor [S]chemes")
      map(
        "<leader>ss",
        function()
          fzf_lua.grep_project({ search = vim.fn.input("Search for > ") })
        end,
        "[S]earch [S]tring"
      )
      map("<leader>/", fzf_lua.lgrep_curbuf, "[/] Fuzzily search in current buffer")

      local function closeAllBuffers()
        local buffers = vim.api.nvim_list_bufs()
        for _, buffer in ipairs(buffers) do
          if buffer ~= vim.api.nvim_get_current_buf() then
            vim.api.nvim_buf_delete(buffer, { force = true })
          end
        end
      end

      map("<leader>bf", fzf_lua.buffers, "[B]uffer list", false)
      map("<leader>bd", ":bdelete<cr>", "[B]uffer [D]elete", false)
      map("<leader>bD", closeAllBuffers, "[B]uffer [D]elete all but current", false)
      map("<leader>bn", ":bnext<cr>", "[B]uffer [N]ext", false)
      map("<leader>bp", ":bprevious<cr>", "[B]uffer [P]revious", false)
    end
  }
}
