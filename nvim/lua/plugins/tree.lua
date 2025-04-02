vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open tree" })

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			watch_for_changes = true,
		})
	end,
}
