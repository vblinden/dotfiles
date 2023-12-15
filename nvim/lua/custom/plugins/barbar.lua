return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
		icons = {
			filetype = {
				enabled = false
			},
		},
	},
	version = '^1.0.0',
}

