-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	config = function()
-- 		-- load the colorscheme here
-- 		vim.o.background = "dark"
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }

return {
	"navarasu/onedark.nvim",
	name = "onedark",
	priority = 1000,
	config = function()
		require("onedark").setup({
			code_style = {
				comments = "none",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},
		})

		vim.cmd.colorscheme("onedark")
	end,
}
