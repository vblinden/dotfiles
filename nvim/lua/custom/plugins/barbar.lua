return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',
	},
	branch = "master",
	commit = "4ba9ac5",
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
		auto_hide = 3,
		icons = {
			filetype = {
				enabled = false
			},
		},
		sidebar_filetypes = {
			['neo-tree'] = { event = 'BufWipeout' },
		},
	},
	version = '^1.0.0',
}
