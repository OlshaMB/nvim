return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "biome" },
			javascriptreact = { "biome" },
			typescript = { "biome" },
			typescriptreact = { "biome" },
			css = { "biome" },
			html = { "prettier" },
			json = { "biome" },
			jsonc = { "biome" },
			yaml = { "yamlfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
