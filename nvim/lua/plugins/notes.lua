vim.keymap.set("n", "<leader>n", "<cmd>MapleNotes<CR>", {
	noremap = true,
	silent = true,
	desc = "Open maple Todo List",
})

return {
	"forest-nvim/maple.nvim",
	config = function()
		require("maple").setup({
			-- Your configuration options here
		})
	end,
}
