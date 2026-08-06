vim.g.fugitive_gitlab_domains = {
	"gitlab.nl.team.blue",
	"gitlab.group.team.blue",
}

return {
	-- Detect tabstop and shiftwidth automatically
	{ "NMAC427/guess-indent.nvim", opts = {} },

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

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
			vim.keymap.set("n", "<leader>do", "<cmd>:DiffviewOpen<CR>", { desc = "[D]iff [O]pen" })
		end,
	},

	-- Collection of various small independent plugins/modules
	{
		"nvim-mini/mini.nvim",
		config = function()
			-- Icons (also mocks nvim-web-devicons for plugins that still expect it)
			if vim.g.have_nerd_font then
				require("mini.icons").setup()
				MiniIcons.mock_nvim_web_devicons()
			end

			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yiiq - [Y]ank [I]nside [I]+1 [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({
				-- Avoid conflicts with built-in incremental selection mappings on Neovim>=0.12
				-- (see `:help treesitter-incremental-selection`)
				mappings = {
					around_next = "aa",
					inside_next = "ii",
				},
				n_lines = 500,
			})

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- Cursor location as LINE:COLUMN
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
			--  Check out: https://github.com/nvim-mini/mini.nvim
		end,
	},
}
