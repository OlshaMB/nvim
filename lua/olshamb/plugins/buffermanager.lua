return {
	{
		"j-morano/buffer_manager.nvim",
		deps = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			width = 0.6,
			height = 0.7,
			order_buffers = "lastused",
		},
		keys = {
			{
				"<Leader>mb",
				function()
					require("buffer_manager.ui").toggle_quick_menu()
				end,
				desc = "Manage buffers",
			},
		},
	},
}
