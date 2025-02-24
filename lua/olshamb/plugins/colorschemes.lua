return {
	{
		"savq/melange-nvim",
		priority = 1000,
		config = function()
			--			vim.cmd.colorscheme("melange")
		end,
	},
	{
		"Shatur/neovim-ayu",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("ayu")
		end,
	},
}
