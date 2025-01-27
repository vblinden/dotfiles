return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				functions = { italic = false },
				variables = { italic = false },
			},

			---@param colors ColorScheme
			on_colors = function(colors) end,

			---@param highlights tokyonight.Highlights
			---@param colors ColorScheme
			on_highlights = function(highlights, colors) end,
		})

		vim.cmd([[colorscheme tokyonight]])
	end,
}

-- return {
-- 	"catppuccin/nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			integrations = {
-- 				neotree = true,
-- 				which_key = true,
-- 				barbar = true,
-- 			},
-- 			no_italic = true,
-- 		})
--
-- 		vim.cmd.colorscheme("catppuccin-frappe")
-- 	end,
-- }
