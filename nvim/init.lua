-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.copilot_no_tab_map = true

vim.g.have_nerd_font = false

-- Enable mouse mode
vim.o.mouse = "a"

-- Tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Indentation
vim.opt.autoindent = true
vim.opt.cindent = true

-- Wrap
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true

-- Relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8

-- Backup
vim.o.backup = true
vim.o.backupdir = ".vim/backup/"
vim.o.writebackup = true
vim.o.backupcopy = "yes"

-- Control-C for insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Center when going page up and down or searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When combining line, let cursor alone
vim.keymap.set("n", "J", "mzJ`z")

-- Move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Try out switching tabs
vim.keymap.set("n", "<leader>kt", "<Cmd>BufferPick<CR>")

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.termguicolors = true

-- Configure how new split should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Spelling
-- vim.opt.spell = true
-- vim.opt.spelllang = { "en_us" }

vim.filetype.add({
	extension = {
		env = "conf",
		templ = "templ",
	},
	filename = {
		[".env"] = "conf",
		["env"] = "conf",
	},
	pattern = {
		["%.env%.[%w_.-]+"] = "conf",
	},
})

-- [[ Basic Kymaps ]]
-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Esc, esc exits terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Pleb, you should use H to move"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Pleb, you should use L to move"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Pleb, you should use K to move"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Pleb, you should use J to move"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "gh", "<cmd>diffget //2<cr>", { desc = "Get the hunk in the left" })
vim.keymap.set("n", "gl", "<cmd>diffget //3<cr>", { desc = "Get the hunk in the right" })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Install plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--Configure plugins
require("lazy").setup({
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Git related
	"tpope/vim-rhubarb",
	"tpope/vim-fugitive",

	{ import = "plugins" },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
