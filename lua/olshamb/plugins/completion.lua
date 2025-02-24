return {
	{
		"saghen/blink.compat",
		-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
		version = "*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
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
					"avante_commands",
					"avante_mentions",
					"avante_files",
					---
					"minuet",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					minuet = {
						name = "minuet",
						module = "minuet.blink",
						score_offset = 8,
					},
					avante_commands = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 90, -- show at a higher priority than lsp
						opts = {},
					},
					avante_files = {
						name = "avante_files",
						module = "blink.compat.source",
						score_offset = 100, -- show at a higher priority than lsp
						opts = {},
					},
					avante_mentions = {
						name = "avante_mentions",
						module = "blink.compat.source",
						score_offset = 1000, -- show at a higher priority than lsp
						opts = {},
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
