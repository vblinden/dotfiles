return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm",
			light_style = "day",
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			},
		})

		vim.cmd.colorscheme("tokyonight-storm")
	end,
}
