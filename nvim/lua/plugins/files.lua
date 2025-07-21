-- vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open tree" })
vim.keymap.set("n", "-", "<cmd>Fyler<cr>", { desc = "Open tree" })

return {
	"A7Lavinraj/fyler.nvim",
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		default_explorer = true,
		views = {
			explorer = {
				kind = "split:right",
				width = 0.3,
			},
		},
	},
}

-- return {
-- 	"stevearc/oil.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("oil").setup({
-- 			default_file_explorer = true,
-- 			watch_for_changes = true,
-- 		})
-- 	end,
-- }
