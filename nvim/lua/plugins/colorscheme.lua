return {
	"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		vim.o.background = "dark"
		vim.cmd.colorscheme("tokyonight")
	end,
}

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			no_italic = true,
-- 		})
--
-- 		vim.cmd.colorscheme("catppuccin-frappe")
-- 	end,
-- }
