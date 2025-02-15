return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luac" },
			javascript = { "biome" },
			javascriptreact = { "biome" },
			typescript = { "biome" },
			typescriptreact = { "biome" },
			css = { "biome" },
			html = { "prettier" },
			json = { "biome" },
			jsonc = { "biome" },
		}
	end,
}
