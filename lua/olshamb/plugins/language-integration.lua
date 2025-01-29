local plugins = {}
local dependencies = {}
if vim.g.olshamb_mason_enabled then
	table.insert(dependencies, "williamboman/mason-lspconfig.nvim")
	table.insert(plugins, {
		"williamboman/mason.nvim",
		dependencies = dependencies,
		config = function()
			local mason = require("mason")
			local ensure_installed = {
				"ts_ls",
				"cssls",
				"html",
				"jsonls",
				"lua_ls",
			}
			local mason_lspconfig = require("mason-lspconfig")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			mason_lspconfig.setup({
				ensure_installed = ensure_installed,
			})
		end,
	})
end
table.insert(dependencies, "folke/snacks.nvim")
table.insert(plugins, {
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = dependencies,
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			vim.keymap.set(
				"n",
				"gl",
				vim.diagnostic.open_float,
				{ desc = "Line diagnostic" }
			)
			vim.keymap.set(
				"n",
				"[d",
				vim.diagnostic.goto_prev,
				{ desc = "Next diagnostic" }
			)
			vim.keymap.set(
				"n",
				"]d",
				vim.diagnostic.goto_next,
				{ desc = "Prev diagnostic" }
			)
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "Lsp Actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					opts.desc = "Go to declaration"
					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						opts
					)

					opts.desc = "Code actions"
					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						opts
					)

					opts.desc = "Rename"
					vim.keymap.set(
						"n",
						"<leader>rn",
						vim.lsp.buf.rename,
						opts
					)

					opts.desc = "Hover"
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "LSP references"
					vim.keymap.set(
						"n",
						"gR",
						Snacks.picker.lsp_references,
						opts
					)

					opts.desc = "LSP definitions"
					vim.keymap.set(
						"n",
						"gd",
						Snacks.picker.lsp_definitions,
						opts
					)

					opts.desc = "LSP implementations"
					vim.keymap.set(
						"n",
						"gi",
						Snacks.picker.lsp_implementations,
						opts
					)

					opts.desc = "LSP type definitions"
					vim.keymap.set(
						"n",
						"gt",
						Snacks.picker.lsp_type_definitions,
						opts
					)
					opts.desc = "LSP Workspace"
					vim.keymap.set(
						"n",
						"<leader>ws",
						Snacks.picker.lsp_workspace_symbols,
						opts
					)
				end,
			})
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = require("blink.cmp").get_lsp_capabilities(),
					})
				end,
			})
		end,
	}
)
return plugins
