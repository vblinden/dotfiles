return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		close_if_last_window = true,
		auto_clean_after_session_restore = true,
		window = {
			position = "right",
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					--auto close
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
	keys = {
		{
			"<leader>fr",
			function()
				require("neo-tree.command").execute({ reveal = true })
			end,
			desc = "Explorer (reveal)",
		},
		{
			"<leader>fe",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end,
			desc = "Explorer (root dir)",
		},
		{
			"<leader>fE",
			function()
				require("neo-tree.command").execute({ toggle = true, reveal = true })
			end,
			desc = "Explorer (reveal)",
		},
		{ "<leader>e", "<leader>fe", desc = "Explorer (root dir)", remap = true },
		{ "<leader>E", "<leader>fE", desc = "Explorer (reveal)", remap = true },
		{
			"<leader>ge",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Git Explorer",
		},
		{
			"<leader>be",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Buffer Explorer",
		},
	},
}
