return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({})

		vim.cmd.colorscheme("catppuccin-frappe")
	end,
}
