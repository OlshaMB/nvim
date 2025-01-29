vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"

vim.opt.scrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.laststatus = 3

vim.g.olshamb_mason_enabled = true
