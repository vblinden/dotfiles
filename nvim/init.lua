-- Hello friends, and welcome to my Neovim setup.
-- Please use this file as a reference, and don't copy it directly.
-- It's heavily tailored to my personal preferences.

-- Set <space> as the leader key
-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install lazy.nvim, a plugin manager
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

-- Modules
require("options")
require("keymaps")
require("aucmds")

-- Setup lazy.nvim plugins
require("lazy").setup("plugins", {
	checker = {
		enabled = true,
		concurrency = 20,
		notify = false,
		frequency = 3600, -- Every hour
	},
	defaults = { lazy = false },
})

-- The line beneath this is called `modeline`.
-- vim: ts=2 sts=2 sw=2 et
