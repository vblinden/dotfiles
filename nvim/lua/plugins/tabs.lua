return {
	"romgrk/barbar.nvim",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {

		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		animation = false,
		insert_at_end = true,
		-- insert_at_start = true,
		-- …etc.
		icons = {
			filetype = {
				enabled = false,
			},
		},
		-- letters = "123456789",
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
