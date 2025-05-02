return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-k>",
					next = "<C-l>",
					prev = "<C-h>",
				},
			},
			-- copilot_model = "",
		})
	end,
}

-- return {
-- 	"github/copilot.vim",
-- 	config = function()
-- 		vim.keymap.set("i", "<C-k>", 'copilot#Accept("\\<CR>")', {
-- 			expr = true,
-- 			replace_keycodes = false,
-- 		})
-- 	end,
-- }
