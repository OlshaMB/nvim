--[[
return {
	dir = "~/Projects/my_bar.nvim",
	name = "my_bar",
	lazy = false,
	config = function()
		local my_bar = require("my_bar")
		--- @module "my_bar"
		--- @type RawBar
		local widgets = {}
		local modes = {
			["n"] = "NORMAL",
			["no"] = "OPERATOR-PENDING",
			["nov"] = "OPERATOR-PENDING",
			["noV"] = "OPERATOR-PENDING", --nov	    operator-pending (forced linewise |o_v|)
			["noCTRL-V"] = "OPERATOR-PENDING", --noctrl-v operator-pending (forced blockwise |o_ctrl-v|)
			["niI"] = "NORMAL", --nii	    normal using |i_ctrl-o| in |insert-mode|
			["niR"] = "NORMAL", --nir	    normal using |i_ctrl-o| in |replace-mode|
			["niV"] = "NORMAL", --niv	    normal using |i_ctrl-o| in |virtual-replace-mode|
			["nt"] = "NORMAL", --nt	    normal in |terminal-emulator| (insert goes to terminal mode)
			["ntT"] = "NORMAL", --ntt	    normal using |t_ctrl-\_ctrl-o| in |terminal-mode|
			["v"] = "VISUAL", --v	    visual by character
			["vs"] = "VISUAL", --vs	    visual by character using |v_ctrl-o| in select mode
			["V"] = "VISUAL", --v	    visual by line
			["Vs"] = "VISUAL", --vs	    visual by line using |v_ctrl-o| in select mode
			["CTRL-V"] = "VISUAL", --ctrl-v   visual blockwise
			["CTRL-Vs"] = "VISUAL", --ctrl-vs  visual blockwise using |v_ctrl-o| in select mode
			["s"] = "SELECT", --s	    select by character
			["S"] = "SELECT", --s	    select by line
			["CTRL-S"] = "SELECT", --ctrl-s   select blockwise
			["i"] = "INSERT", --i	    insert
			["ic"] = "INSERT", --ic	    insert mode completion |compl-generic|
			["ix"] = "INSERT", --ix	    insert mode |i_ctrl-x| completion
			["R"] = "REPLACE", --r	    replace |r|
			["Rc"] = "REPLACE", --rc	    replace mode completion |compl-generic|
			["Rx"] = "REPLACE", --rx	    replace mode |i_ctrl-x| completion
			["Rv"] = "V-REPLACE", --rv	    virtual replace |gr|
			["Rvc"] = "V-REPLACE", --rvc	    virtual replace mode completion |compl-generic|
			["Rvx"] = "V-REPLACE", --rvx	    virtual replace mode |i_ctrl-x| completion
			["c"] = "COMMAND-LINE", --c	    command-line editing
			["cr"] = "COMMAND-LINE", --cr	    command-line editing overstrike mode |c_<insert>|
			["cv"] = "EX", --cv	    vim ex mode |gq|
			["cvr"] = "EX", --cvr	    vim ex mode while in overstrike mode |c_<insert>|
			["r"] = "HIT-ENTER", --r	    hit-enter prompt
			["rm"] = "MORE", --rm	    the -- more -- prompt
			["r?"] = "CONFIRM", --r?	    a |:confirm| query of some sort
			["!"] = "SHELL", --!	    shell or external command is executing
			["t"] = "TERMINAL", --t	    terminal mode: keys go to the job
		}
		local function mode_widget()
			return modes[vim.api.nvim_get_mode().mode]
		end
		local function spacer(i)
			table.insert(widgets, {
				string.format("spacer%d", i),
				false,
				render = function()
					return "%="
				end,
				should_update = function()
					return false
				end,
			})
		end
		table.insert(widgets, {
			"mode",
			"ModeChanged",
			render = mode_widget,
			should_update = function()
				return true
			end,
		})
		spacer(1)
		table.insert(widgets, {
			"file",
			false,
			render = function()
				return "%f %m%r"
			end,
			should_update = function()
				return false
			end,
		})
		spacer(2)
		table.insert(widgets, {
			"line:column",
			false,
			render = function()
				return "%l:%c"
			end,
			should_update = function()
				return false
			end,
		})
		my_bar.bind(widgets, function(bar)
			vim.o.statusline = bar
		end)
	end,
}
--]]
return {}
