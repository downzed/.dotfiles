local icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}

local sources = {
  nvim_lsp = "lsp",
  luasnip = "snip",
  buffer = "buf",
  path = "",
  cmdline = "",
}

return {
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  -- "onsails/lspkind.nvim",
  "L3MON4D3/LuaSnip",
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      -- local lspkind = require('lspkind')

      local cmp_select = { behavior = cmp.SelectBehavior.Insert }

      cmp.setup({
        window = {
          documentation = cmp.config.window.bordered({
            border = "rounded",
          }),
          completion = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          }),
        },

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer', keyword_length = 2 },
          { name = 'crates' },
        }),

        formatting = {
          -- fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = vim_item.kind
            vim_item.kind = (icons[kind] or "") .. " " .. kind
            local source = entry.source.name
            vim_item.menu = " [" .. sources[source] .. "]"
            return vim_item
          end
        }
      })


      local mapping = cmp.mapping.preset.cmdline()
      local config = {
        mapping = mapping,
        sources = {
          { name = "buffer" },
        },
      }
      local cmd_config = {
        mapping = mapping,
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man" },
            },
          },
        }),
      }

      cmp.setup.cmdline("/", config)
      cmp.setup.cmdline("?", config)
      cmp.setup.cmdline(":", cmd_config)
    end,
  },
}
