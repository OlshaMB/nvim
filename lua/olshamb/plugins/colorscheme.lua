return {
	--[[	{
		"mellow-theme/mellow.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.g.mellow_transparent = true
			--vim.cmd.colorscheme("mellow")
		end,
	},
--]]
	--[[
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
	--]]
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				--transparent_mode = true,
				contrast = "hard",
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
