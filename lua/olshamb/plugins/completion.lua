return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		config = true,
	},
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "super-tab",
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
				-- optionally disable cmdline completions
				-- cmdline = {},
			},

			completion = {
				keyword = {
					range = "full",
				},
				ghost_text = {
					enabled = false,
				},
				documentation = {
					auto_show = true,
				},
			},

			signature = {
				enabled = true,
			},
		},
	},
}
