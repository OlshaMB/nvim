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
		lazy = false,
		config = function()
			local ayu = require("ayu")
			local colors = require("ayu.colors")
			colors.generate(false)
			ayu.setup({
				overrides = {
					SnacksPickerDir = { fg = colors.comment },
				},
			})
			vim.cmd.colorscheme("ayu")
		end,
	},
}
