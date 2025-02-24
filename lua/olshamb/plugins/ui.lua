---@module "snacks"
return {
	{
		"folke/snacks.nvim",
		priority = 2000,
		lazy = false,
		---@type snacks.Config
		opts = {
			indent = { enabled = true },
			input = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 1000,
			},
			picker = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fe",
				function()
					Snacks.picker.explorer({
						layout = {
							preset = "default",
							preview = true,
						},
					})
				end,
			},
			{
				"<leader>fG",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader><leader>",
				function()
					Snacks.picker.recent({
						filter = {
							cwd = true,
						},
					})
				end,
				desc = "Recent",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>nt",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notifications",
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command
				end,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},
}
