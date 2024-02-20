return {
	'ThePrimeagen/harpoon',
	branch = "harpoon2",
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon.setup({
			config = {
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>m", function() harpoon:list():append() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<C-q>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-w>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-m>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-n>", function() harpoon:list():select(4) end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}