return {
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.g.material_style = "darker"
			--vim.cmd([[colorscheme material]])
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main",
				enable = {
					terminal = false,
				},
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
			})
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
}
