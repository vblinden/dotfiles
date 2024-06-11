return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				neotree = true,
				which_key = true,
				barbar = true,
			},
		})

		vim.cmd.colorscheme("catppuccin-frappe")
	end,
}
