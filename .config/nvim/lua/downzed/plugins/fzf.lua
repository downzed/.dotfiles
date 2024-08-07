return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      { "junegunn/fzf", build = "./install --bin" },
    },
    config = function()
      local fzf_lua = require("fzf-lua")
      local actions = require("fzf-lua.actions")
      -- calling `setup` is optional for customization
      fzf_lua.setup({
        'default-title',
        keymap = {
          builtin = {
            ["<C-d>"] = "preview-page-down",
            ["<C-u>"] = "preview-page-up",
          },
        },
        grep = {
          actions = {
            -- actions inherit from 'actions.files' and merge
            -- this action toggles between 'grep' and 'live_grep'
            ["ctrl-g"] = { actions.grep_lgrep },
            ["ctrl-q"] = { actions.file_sel_to_qf },
            -- uncomment to enable '.gitignore' toggle for grep
            ["ctrl-r"] = { actions.toggle_ignore }
          },
        },
        oldfiles = {
          prompt                  = 'recent files » ',
          cwd_only                = true,
          stat_file               = true, -- verify files exist on disk
          include_current_session = true, -- include bufs from current session
        },
      })

      --- customized map function
      ---@param keys string
      ---@param func function | string
      ---@param desc string
      ---@param use_desc? boolean
      ---@default true
      local map = function(keys, func, desc, use_desc)
        if use_desc == nil then use_desc = true end
        vim.keymap.set('n', keys, func, {
          desc = use_desc and "FZF: " .. desc or desc
        })
      end


      ---custom fzf finder
      ---@param dir  "neorg" | "dots"
      local function fzf_custom(dir)
        local is_neorg = dir == "neorg"
        local cwd      = is_neorg and "~/Developer/notes" or "~/Developer/.dotfiles"
        local prompt   = is_neorg and 'Neorg » ' or '.dots » '

        fzf_lua.files({
          prompt   = prompt,
          cwd      = cwd,
          cwd_only = false
        })
      end

      map("<leader>st", function() fzf_lua.grep({ search = 'TODO|HACK|PERF|NOTE|FIX', no_esc = true }) end,
        "[S]earch [T]odo")

      map("<leader>sn", function() fzf_custom("neorg") end, "[S]earch [N]eorg")
      map("<leader>sd", function() fzf_custom("dots") end, "[S]earch [D]otfiles")

      map("<leader>sf", fzf_lua.files, "[S]earch [F]iles")
      map("<leader>sg", fzf_lua.git_files, "[S]earch [G]it files")
      map("<leader>sh", fzf_lua.helptags, "[S]earch [H]elp")
      map("<leader>sk", fzf_lua.keymaps, "[S]earch [K]eymaps")
      map("<leader>so", fzf_lua.oldfiles, "[S]earch [O]ldfiles")
      map("<leader>sw", fzf_lua.grep_cword, "[S]earch [W]ord")
      map("<leader>sW", fzf_lua.grep_cWORD, "[S]earch [W]ord [E]xpression")
      map("<leader>scs", fzf_lua.colorschemes, "[S]earch [C]olor [S]chemes")
      map("<leader>ss", fzf_lua.live_grep, "[S]earch [S]tring")
      map("<leader>/", fzf_lua.lgrep_curbuf, "[/] Fuzzily search in current buffer")

      local function closeAllBuffers()
        local buffers = vim.api.nvim_list_bufs()
        for _, buffer in ipairs(buffers) do
          if buffer ~= vim.api.nvim_get_current_buf() then
            vim.api.nvim_buf_delete(buffer, { force = true })
          end
        end
      end

      map("<leader>gcb", fzf_lua.git_bcommits, "[G]it [C]ommit [B]uffer", false)
      map("<leader>gb", fzf_lua.git_branches, "[G]it [B]ranches", false)

      map("<leader>bf", fzf_lua.buffers, "[B]uffer list", false)
      map("<leader>bd", ":bdelete<cr>", "[B]uffer [D]elete", false)
      map("<leader>bD", closeAllBuffers, "[B]uffer [D]elete all but current", false)
      map("<leader>bn", ":bnext<cr>", "[B]uffer [N]ext", false)
      map("<leader>bp", ":bprevious<cr>", "[B]uffer [P]revious", false)
    end
  }
}
