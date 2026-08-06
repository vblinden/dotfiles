-- GrokNight is a local colorscheme: colors/groknight.lua
return {
	name = "groknight",
	dir = vim.fn.stdpath("config"),
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("groknight")
	end,
}
