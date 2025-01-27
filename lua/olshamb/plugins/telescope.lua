return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				pickers = {
					lsp_dynamic_workspace_symbols = {
						sorter = telescope.extensions.fzf.native_fzf_sorter({
							fuzzy = true,
							case_mode = "smart_case",
						}),
					},
				},
				extensions = {
					smart_open = {
						match_algorithm = "fzf",
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
		keys = {
			{
				"<Leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find file",
			},
			{
				"<Leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				"<Leader>b",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
		},
	},
	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		keys = {
			{
				"<Leader><Leader>",
				function()
					require("telescope").extensions.smart_open.smart_open({
						cwd_only = true,
					})
				end,
				desc = "Find file",
			},
		},
	},
}
