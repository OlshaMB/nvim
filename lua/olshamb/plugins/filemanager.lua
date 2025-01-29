return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"-",
				"<CMD>Oil<CR>",
				desc = "File manager",
			},
		},
	},
}
