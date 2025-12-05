vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		local current_file = vim.fn.expand("%:p")
		local home_dir = vim.fn.expand("$HOME")
		local folder = home_dir .. "/Code/teamblue/customer-frontend"

		if vim.startswith(current_file, folder) then
			vim.fn.SyncUploadFile()
		end
	end,
})

vim.keymap.set("n", "<leader>dl", "<cmd>:call SyncDownloadFile()<CR>", { desc = "Sync [D]ownload file" })

return {
	"eshion/vim-sync",
	dependencies = {
		"skywind3000/asyncrun.vim",
	},
	config = function()
		vim.keymap.del("n", "<leader>sd")
	end,
}
