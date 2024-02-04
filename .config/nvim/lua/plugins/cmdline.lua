return {

	{
		"hrsh7th/cmp-cmdline",
		config = function()
			local cmp = require("cmp")
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
	{ "hrsh7th/cmp-buffer" },
}
