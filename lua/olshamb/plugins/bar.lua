return {
	"MunifTanjim/nougat.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nougat = require("nougat")
		local Bar = require("nougat.bar")
		local sep = require("nougat.separator")
		local color = require("nougat.color").get()
		local stl = Bar("statusline", {
			hl = {
				bg = "none",
				fg = color.bg,
			},
		})
		local spacer = require("nougat.nut.spacer").create

		local mode = require("nougat.nut.mode").create({
			config = {
				highlight = {
					normal = {
						bg = color.fg,
						fg = color.bg,
					},
					visual = {
						bg = color.yellow,
						fg = color.bg,
					},
					insert = {
						bg = color.blue,
						fg = color.bg,
					},
					replace = {
						bg = color.magenta,
						fg = color.bg,
					},
					commandline = {
						bg = color.green,
						fg = color.bg,
					},
					terminal = {
						bg = color.cyan,
						fg = color.bg,
					},
					inactive = {
						bg = color.fg,
						fg = color.bg,
					},
				},
			},
			sep_left = sep.left_half_circle_solid(true),
			sep_right = sep.right_half_circle_solid(true),
		})
		stl:add_item(mode)
		stl:add_item(sep.space())
		local branch = require("nougat.nut.git.branch").create({
			hl = {
				bg = color.blue,
			},
			sep_left = sep.left_half_circle_solid(true),
			prefix = " ",
			sep_right = sep.right_half_circle_solid(true),
		})
		stl:add_item(branch)
		stl:add_item(sep.space())
		stl:add_item(sep.space())
		local filename = require("nougat.nut.buf.filename").create({

			hl = {
				bg = color.fg,
			},
			sep_left = sep.left_half_circle_solid(true),
			sep_right = sep.right_half_circle_solid(true),
		})
		stl:add_item(filename)
		stl:add_item(sep.space())
		stl:add_item(spacer())
		local diagnostic =
			require("nougat.nut.buf.diagnostic_count").create({
				hl = {
					bg = color.bg3,
				},
				sep_left = sep.left_half_circle_solid(true),
				sep_right = sep.right_half_circle_solid(true),
				config = {
					error = { prefix = " " },
					warn = { prefix = " " },
					info = { prefix = " " },
					hint = { prefix = "󰌶 " },
				},
			})
		stl:add_item(diagnostic)
		stl:add_item(sep.space())
		local ruler = require("nougat.nut.ruler").create({

			hl = {
				bg = color.green,
			},
			sep_left = sep.left_half_circle_solid(true),
			sep_right = sep.right_half_circle_solid(true),
		})
		stl:add_item(ruler)
		nougat.set_statusline(stl)
	end,
}
