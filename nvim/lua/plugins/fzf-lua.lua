return {
	"ibhagwan/fzf-lua",
	dependencies = {
		-- Prefer mini.icons mock when available; fall back to nvim-web-devicons
		{ "nvim-tree/nvim-web-devicons", enabled = not vim.g.have_nerd_font },
	},
	config = function()
		local fzf_lua = require("fzf-lua")
		local actions = require("fzf-lua").actions

		require("fzf-lua").register_ui_select()

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
			winopts = {
				preview = {
					vertical = "down:65%",
					layout = "vertical",
				},
			},
			lsp = {
				code_actions = {
					previewer = false,
					winopts = {
						height = 0.3,
						width = 0.5,
					},
				},
			},
		})

		-- Search keymaps (kickstart-style, fzf-lua instead of Telescope)
		vim.keymap.set("n", "<leader>sh", fzf_lua.helptags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", fzf_lua.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", fzf_lua.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", fzf_lua.builtin, { desc = "[S]earch [S]elect fzf-lua" })
		vim.keymap.set({ "n", "v" }, "<leader>sw", fzf_lua.grep_cword, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", fzf_lua.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", fzf_lua.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", fzf_lua.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", fzf_lua.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>se", fzf_lua.oldfiles, { desc = "[S]earch old files" })
		vim.keymap.set("n", "<leader>sc", fzf_lua.commands, { desc = "[S]earch [C]ommands" })
		vim.keymap.set("n", "<leader>sl", fzf_lua.lines, { desc = "[S]earch [L]ines" })
		vim.keymap.set("n", "<leader><leader>", fzf_lua.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>e", fzf_lua.buffers, { desc = "[E]xplore Buffers" })

		-- Fuzzily search in current buffer
		vim.keymap.set("n", "<leader>/", function()
			fzf_lua.blines({ winopts = { height = 0.4, preview = { hidden = true } } })
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- Live grep across lines in open buffers
		vim.keymap.set("n", "<leader>s/", function()
			fzf_lua.lines({ prompt = "Open Files❯ " })
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			fzf_lua.files({ cwd = vim.fn.stdpath("config"), follow = true })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
