return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			},
		})

		vim.cmd.colorscheme("tokyonight-moon")
	end,
}
