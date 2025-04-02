return {
	"romgrk/barbar.nvim",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = false,
		insert_at_end = true,
		-- insert_at_start = true,
		icons = {
			filetype = {
				enabled = false,
			},
		},
		maximum_padding = 0,
		-- letters = "123456789",
	},
	version = "^1.0.0",
}
