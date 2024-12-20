local M = {}

--- @class Widget
--- @field [1] string widget id used for caching
--- @field [2] string Autocmd eventname that triggers state change
--- @field pattern string?
--- @field render fun(): string
--- @field should_update fun(): boolean

--- @alias RawBar Widget[]
--- @alias DrawFunction fun(string)
--- @alias RenderFunction fun(DrawFunction, Widget, boolean)

--- @param raw_bar RawBar
--- @param redraw DrawFunction
--- @param rerender RenderFunction?
M.bind = function(raw_bar, redraw, rerender)
	--- @type table<string, string>
	local cache = {}
	local group = vim.api.nvim_create_augroup("MyBar", {
		clear = true,
	})
	--- @type RenderFunction
	local render = rerender
		or function(draw, blamed_widget, force)
			--- @type string[]
			local bar = {}
			for _, widget in pairs(raw_bar) do
				if
					force
					or widget == blamed_widget
					or widget.should_update()
				then
					local rendered = widget.render()
					table.insert(bar, rendered)
					cache[widget[1]] = rendered
				else
					table.insert(bar, cache[widget[1]])
				end
			end
			draw(table.concat(bar))
		end
	for _, widget in pairs(raw_bar) do
		vim.api.nvim_create_autocmd(widget[1], {
			pattern = widget.pattern,
			callback = function(...)
				if widget.should_update(unpack(...)) then
					vim.schedule(function()
						render(redraw, widget)
					end)
				end
			end,
			group = group,
		})
	end
	render(redraw, nil, true)
end
M.bind({
	{
		"mode",
		"ModeChanged",
		render = function()
			return vim.api.nvim_get_mode().mode
		end,
		should_update = function()
			return true
		end,
	},
}, function(bar)
	vim.o.winbar = bar
end)
return M
