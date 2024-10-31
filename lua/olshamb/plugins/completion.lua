return {
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = "rafamadriz/friendly-snippets",

		version = "v0.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				["<C-space>"] = {
					"show",
					"show_documentation",
					"hide_documentation",
				},
				["<A-k>"] = { "select_prev", "fallback" },
				["<A-j>"] = { "select_next", "fallback" },
				["<A-b>"] = { "scroll_documentation_up", "fallback" },
				["<A-f>"] = {
					"scroll_documentation_down",
					"fallback",
				},
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<C-e>"] = { "hide" },
				["<CR>"] = { "select_and_accept", "fallback" },
			},

			highlight = {
				use_nvim_cmp_as_default = true,
			},
			nerd_font_variant = "mono",

			-- experimental auto-brackets support
			accept = { auto_brackets = { enabled = true } },

			-- experimental signature help support
			trigger = { signature_help = { enabled = true } },
			windows = {
				autocomplete = {
					selection = "manual",
				},
			},
		},
	},
}
