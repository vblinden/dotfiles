-- Hello friends, and welcome to my Neovim setup.
-- Please use this file as a reference, and don't copy it directly.
-- It's heavily tailored to my personal preferences.

-- lazy.nvim, a plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("filetype")
require("maps")
require("aucmd")

require("lazy").setup("plugins", {
	checker = {
		enabled = true,
		concurrency = 20,
		notify = false,
		frequency = 3600, -- every hour
	},
	defaults = { lazy = false },
	ui = {
		backdrop = 100,
	},
})

vim.keymap.set("n", "<leader>pm", "<cmd>Lazy<cr>", { desc = "Open [p]ackage [m]anager" })

-- vim: ts=2 sts=2 sw=2 et
