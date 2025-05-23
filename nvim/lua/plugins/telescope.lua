return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf_lua = require("fzf-lua")
		local actions = require("fzf-lua").actions

		fzf_lua.setup({
			keymap = {
				fzf = {
					true,
					["ctrl-q"] = "select-all+accept",
				},
			},
			actions = {
				files = {
					true,
					["ctrl-i"] = actions.toggle_ignore,
				},
			},
		})

		vim.keymap.set("n", "<leader>sf", fzf_lua.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sg", fzf_lua.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sr", fzf_lua.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>se", fzf_lua.oldfiles, { desc = "[S]earch old files" })
		vim.keymap.set("n", "<leader>sl", fzf_lua.lines, { desc = "[S]earch [L]ines" })
		vim.keymap.set("n", "<leader>e", fzf_lua.buffers, { desc = "[E]xplore Buffers" })
	end,
}
