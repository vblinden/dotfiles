return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			show_end_of_buffer = true,
			transparent_background = false,
			integrations = {
				which_key = true,
				barbar = true,
				treesitter = true,
				blink_cmp = true,
				mason = true,
				fzf = true,
			},
			no_italic = true,
			no_bold = true,
		})

		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
