return {
  {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'blacktrub/telescope-godoc.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
        pickers = {
          find_files = {
            theme = 'ivy',
            cwd_only = true,
          },
          oldfiles = {
            theme = 'ivy',
            hidden = true,
            cwd_only = true,
          },
          live_grep = {
            theme = 'ivy',
          },
          help_tags = {
            theme = 'ivy',
          },
        },
      })
      local builtin = require('telescope.builtin')

      --- customized map function
      ---@param keys string
      ---@param func function | string
      ---@param desc string
      ---@param use_desc? boolean
      ---@default true
      local map = function(keys, func, desc, use_desc)
        if use_desc == nil then
          use_desc = true
        end
        vim.keymap.set('n', keys, func, {
          desc = use_desc and '[S]earch: ' .. desc or desc,
        })
      end

      --- closes all buffers but the current
      ---@brief closes all buffers but the current
      ---@return nil
      local function close_all_buffers_but_current()
        local buffers = vim.api.nvim_list_bufs()
        for _, buffer in ipairs(buffers) do
          if buffer ~= vim.api.nvim_get_current_buf() then
            vim.api.nvim_buf_delete(buffer, { force = true })
          end
        end
      end

      ---@function grep_cword
      ---@brief Grep for the word under the cursor in Vim.
      ---@param opts table|nil Optional parameters to customize the search. If `upper` is set to true, the function will
      ---expand `<cWORD>` (case-insensitive) instead of the default `<cword>` (case-sensitive).
      ---@return nil The function does not return a value.
      local grep_cword = function(opts)
        local search_term = opts and opts.upper and vim.fn.expand('<cWORD>')
          or vim.fn.expand('<cword>')
        builtin.grep_string({ search = search_term })
      end

      map('<leader>sf', builtin.find_files, '[F]iles')
      map('<leader>ss', builtin.live_grep, '[G]rep')
      map('<leader>sh', builtin.help_tags, '[H]elp tags')
      map('<leader>so', builtin.oldfiles, '[O]ldfiles')

      map('<leader>st', function()
        builtin.grep_string({
          search = 'TODO|HACK|PERF|NOTE|FIX',
          no_esc = true,
        })
      end, '[T]odo')

      map(
        '<leader>/',
        builtin.current_buffer_fuzzy_find,
        '[/] Fuzzily search in current buffer',
        false
      )

      map('<leader>scs', builtin.colorscheme, '[C]olor [S]chemes')
      map('<leader>sm', builtin.man_pages, '[M]anpages')
      -- map("<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")

      map('<leader>sw', function()
        grep_cword()
      end, '[W]ord')
      map('<leader>sW', function()
        grep_cword({ upper = true })
      end, '[W]ord Expression')

      map('<leader>gcb', builtin.git_bcommits, '[G]it [C]ommit [B]uffer', false)
      map('<leader>gb', builtin.git_branches, '[G]it [B]ranches', false)
      map('<leader>gS', builtin.git_status, '[G]it [S]tatus', false)
      map('<leader>sg', builtin.git_files, '[G]it files')

      map('<leader>bf', builtin.buffers, '[B]uffer List', false)
      map('<leader>bd', ':bdelete<cr>', '[B]uffer [D]elete', false)
      map('<leader>bD', close_all_buffers_but_current, '[B]uffer [D]elete all but current', false)
      map('<leader>bn', ':bnext<cr>', '[B]uffer [N]ext', false)
      map('<leader>bp', ':bprevious<cr>', '[B]uffer [P]revious', false)

      telescope.load_extension('ui-select')
      telescope.load_extension('fzf')
      telescope.load_extension('godoc')
    end,
  },
}
