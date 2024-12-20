return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({
				with_sync = true,
			})()
		end,
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = false,
				ignore_install = {},
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"typescript",
					"json",
					"html",
					"css",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
