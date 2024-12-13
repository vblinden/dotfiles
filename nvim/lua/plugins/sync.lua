vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		local current_file = vim.fn.expand("%:p")
		local folder = "/Users/vblinden/Code/teamblue/customer-frontend"

		if vim.startswith(current_file, folder) then
			vim.fn.SyncUploadFile()
		end
	end,
})

return {
	"eshion/vim-sync",
	dependencies = {
		"skywind3000/asyncrun.vim",
	},
}
