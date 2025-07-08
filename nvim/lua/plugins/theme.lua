return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm",
			light_style = "day",
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				functions = {},
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
			day_brightness = 0.3,
			dim_inactive = false,
			lualine_bold = false,

			---@param colors ColorScheme
			on_colors = function(colors) end,

			---@param highlights tokyonight.Highlights
			---@param colors ColorScheme
			on_highlights = function(highlights, colors) end,

			cache = true,
		})

		vim.cmd("colorscheme tokyonight-storm")
	end,
}
