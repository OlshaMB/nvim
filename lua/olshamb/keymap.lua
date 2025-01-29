vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])

vim.keymap.set(
	"n",
	"<C-h>",
	"<C-w><C-h>",
	{ desc = "Move focus to the left window" }
)
vim.keymap.set(
	"n",
	"<C-l>",
	"<C-w><C-l>",
	{ desc = "Move focus to the right window" }
)
vim.keymap.set(
	"n",
	"<C-j>",
	"<C-w><C-j>",
	{ desc = "Move focus to the lower window" }
)
vim.keymap.set(
	"n",
	"<C-k>",
	"<C-w><C-k>",
	{ desc = "Move focus to the upper window" }
)
vim.keymap.set("n", " tb", function()
	vim.api.nvim_command("split")
	vim.api.nvim_command("terminal")
end, { desc = "Open terminal in bottom pane" })
vim.keymap.set("n", " tr", function()
	vim.api.nvim_command("hsplit")
	vim.api.nvim_command("terminal")
end, { desc = "Open terminal in right pane" })
