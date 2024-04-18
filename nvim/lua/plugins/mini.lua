-- Mini files keymaps
vim.keymap.set("n", "<leader>kf", ":lua MiniFiles.open()<CR>", { desc = "Open [F]ileTree" })
vim.keymap.set(
	"n",
	"<leader>kfr",
	":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
	{ desc = "Open [F]ileTree and [R]eveal" }
)

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
		require("mini.files").setup({
			-- mappings = {
			-- 	close = "<Esc>",
			-- },
		})
	end,
}
