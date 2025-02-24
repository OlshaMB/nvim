return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"zs",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"zr",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["a="] = {
								query = "@assignment.outer",
								desc = "Select outer part of an assignment",
							},
							["i="] = {
								query = "@assignment.inner",
								desc = "Select inner part of an assignment",
							},
							["l="] = {
								query = "@assignment.lhs",
								desc = "Select left hand side of an assignment",
							},
							["r="] = {
								query = "@assignment.rhs",
								desc = "Select right hand side of an assignment",
							},

							["aa"] = {
								query = "@parameter.outer",
								desc = "Select outer part of a parameter/argument",
							},
							["ia"] = {
								query = "@parameter.inner",
								desc = "Select inner part of a parameter/argument",
							},

							["ai"] = {
								query = "@conditional.outer",
								desc = "Select outer part of a conditional",
							},
							["ii"] = {
								query = "@conditional.inner",
								desc = "Select inner part of a conditional",
							},

							["al"] = {
								query = "@loop.outer",
								desc = "Select outer part of a loop",
							},
							["il"] = {
								query = "@loop.inner",
								desc = "Select inner part of a loop",
							},

							["af"] = {
								query = "@call.outer",
								desc = "Select outer part of a function call",
							},
							["if"] = {
								query = "@call.inner",
								desc = "Select inner part of a function call",
							},

							["am"] = {
								query = "@function.outer",
								desc = "Select outer part of a method/function definition",
							},
							["im"] = {
								query = "@function.inner",
								desc = "Select inner part of a method/function definition",
							},

							["ac"] = {
								query = "@class.outer",
								desc = "Select outer part of a class",
							},
							["ic"] = {
								query = "@class.inner",
								desc = "Select inner part of a class",
							},
						},
					},
				},
			})
			local ts_repeat_move =
				require("nvim-treesitter.textobjects.repeatable_move")

			-- vim way: ; goes to the direction you were moving.
			vim.keymap.set(
				{ "n", "x", "o" },
				";",
				ts_repeat_move.repeat_last_move
			)
			vim.keymap.set(
				{ "n", "x", "o" },
				",",
				ts_repeat_move.repeat_last_move_opposite
			)
		end,
	},
}
