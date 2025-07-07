-- return {
-- 	"sainnhe/gruvbox-material",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.gruvbox_material_enable_italic = false
-- 		vim.g.gruvbox_material_disable_italic_comment = true
-- 		vim.g.gruvbox_material_cursor = "red"
-- 		vim.g.gruvbox_material_background = "soft"
-- 		vim.g.gruvbox_material_better_performance = 1
--
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			show_end_of_buffer = true,
			transparent_background = false,
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15,
			},
			integrations = {
				which_key = true,
				barbar = true,
				treesitter = true,
				blink_cmp = true,
				mason = true,
				fzf = true,
			},
			no_italic = true,
			no_bold = true,
		})

		vim.cmd.colorscheme("catppuccin-frappe")
	end,
}
