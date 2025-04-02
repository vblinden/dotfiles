local o, opt = vim.o, vim.opt

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.copilot_no_tab_map = true

vim.g.have_nerd_font = false

-- Enable mouse mode
o.mouse = "a"

-- Tab width
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Indentation
opt.autoindent = true
opt.cindent = true

-- Wrap
opt.wrap = true
opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

-- Relative line numbers
opt.relativenumber = true
opt.number = true
opt.scrolloff = 8

-- Backup
o.backup = true
o.backupdir = ".vim/backup/"
o.writebackup = true
o.backupcopy = "yes"

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
o.clipboard = "unnamedplus"

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
o.updatetime = 250
o.timeoutlen = 300

o.termguicolors = true

-- Configure how new split should be opened
o.splitright = true
o.splitbelow = true

-- Preview substitutions live
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = false
