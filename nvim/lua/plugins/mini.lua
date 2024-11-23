-- Mini files keymaps
-- vim.keymap.set("n", "<leader>er", ":lua MiniFiles.open()<CR>", { desc = "Open [E]xplorer in [R]oot" })
-- vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", { desc = "Open [E]plorer" })

return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - `af` - around function call
		--  - `inq` - inside next quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		require("mini.surround").setup()

		-- -- Tree
		-- require("mini.files").setup({})
	end,
}
