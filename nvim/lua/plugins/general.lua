vim.g.fugitive_gitlab_domains = {
	"gitlab.nl.team.blue",
	"gitlab.group.team.blue",
}

return {
	-- Detect tabstop and shiftwidth automatically
	"nmac427/guess-indent.nvim",

	-- Git related
	"tpope/vim-rhubarb",
	"tpope/vim-fugitive",
	"shumphrey/fugitive-gitlab.vim",

	-- Diffview
	{
		"sindrets/diffview.nvim",
		config = function()
			vim.keymap.set("n", "<leader>df", "<cmd>:DiffviewFileHistory %<CR>", { desc = "[D]iff [F]ile" })
			vim.keymap.set("n", "<leader>dq", "<cmd>:DiffviewClose<CR>", { desc = "[D]iff [Q]uit" })
			vim.keymap.set("n", "<leader>do", "<cmd>:DiffviewOpen<CR>", { desc = "[D]iff [F]ile" })
		end,
	},

	-- Collection of various small independent plugins/modules
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = false })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_lsp = function()
				return ""
			end

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_fileinfo = function()
				return ""
			end

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_git = function()
				return ""
			end

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_diff = function()
				local br = vim.fn.FugitiveHead()
				return (br ~= "" and br or "")
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
