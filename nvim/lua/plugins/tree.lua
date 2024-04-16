vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open [F]ileTree" })

return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()
	end,
}
