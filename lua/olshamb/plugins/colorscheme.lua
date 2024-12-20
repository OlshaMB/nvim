return {
	{
		"mellow-theme/mellow.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.g.mellow_transparent = true
			--vim.cmd.colorscheme("mellow")
		end,
	},
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				transparent = true,
			})
			vim.cmd.colorscheme("nord")
		end,
	},
}
